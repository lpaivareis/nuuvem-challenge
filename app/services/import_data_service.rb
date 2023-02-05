class ImportDataService < ApplicationService
  require "csv"

  attr_reader :import_file, :purchaser, :csv_file, :order, :merchant

  def initialize(import_file)
    super()
    @import_file = import_file
  end

  def call
    import_orders
    update_total_amount
  rescue StandardError => e
    Rails.logger.error(e)
  end

  private

  def import_orders
    @csv_file = CSV.parse(File.open(file_path), col_sep: "\t", headers: :first_row)

    csv_file.map do |row|
      order = create_order(row)

      create_purchaser(name: row[0], purchase_count: row[3], order_id: order.id)
      create_merchant(name: row[5], address: row[4], order_id: order.id)
    end
  end

  def update_total_amount
    import_file.update!(total_amount: @import_file.orders.sum(:item_price))
  end

  def file_path
    File.open(ActiveStorage::Blob.service.path_for(@import_file.file.blob.key))
  end

  def create_purchaser(purchaser_params)
    @purchaser = Purchaser.find_by(name: purchaser_params[:name])

    if purchaser.present?
      purchaser.update!(purchase_count: purchaser.purchase_count + purchaser_params[:purchase_count])
    else
      Purchaser.create!(purchaser_params)
    end
  end

  def create_merchant(merchant_params)
    @merchant = Merchant.find_by(name: merchant_params[:name])

    if merchant.present?
      merchant.update!(address: merchant_params[:address])
    else
      Merchant.create!(merchant_params)
    end
  end

  def create_order(order_params)
    Order.create!(
      item_description: order_params[1],
      item_price: order_params[2],
      import_file_id: @import_file.id
    )
  end
end
