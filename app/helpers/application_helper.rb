module ApplicationHelper
  def import_title(import)
    "Arquivo importado em (#{import.created_at.strftime('%d/%m/%Y - %H:%M:%S')})"
  end

  def import_total_amount(import_files)
    return "R$0,00" if import_files.nil? || import_files.empty?

    number_to_currency(ImportFile.all.sum(:total_amount), unit: "R$", separator: ",", delimiter: ".")
  end

  def import_last_import_amount(import_file)
    return "R$0,00" unless import_file

    number_to_currency(import_file.total_amount, unit: "R$", separator: ",", delimiter: ".")
  end

  def format_import_item_price(item_price)
    number_to_currency(item_price, unit: "R$", separator: ",", delimiter: ".")
  end
end
