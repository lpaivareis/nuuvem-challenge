class ImportFilesController < ApplicationController
  before_action :set_import_file, only: %i[show destroy]
  after_action :import_orders, only: %i[create]

  def index
    @import_files = ImportFile.all
  end

  def show; end

  def new
    @import_file = ImportFile.new
  end

  def create
    @import_file = ImportFile.new(import_file_params)

    if @import_file.save
      redirect_to import_file_url(@import_file), notice: "Import file was successfully created."

    else
      render :new, status: :unprocessable_entity, notice: "Import file was not created."
    end
  end

  def destroy
    @import_file.destroy

    redirect_to import_files_url, notice: "Import file was successfully destroyed."
  end

  private

  def set_import_file
    @import_file = ImportFile.find(params[:id])
  end

  def import_file_params
    params.require(:import_file).permit(:file)
  end

  def import_orders
    ImportDataService.call(@import_file)
  end
end
