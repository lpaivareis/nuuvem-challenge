module ApplicationHelper
  def import_title(import)
    "Arquivo importado em (#{import.created_at.strftime('%d/%m/%Y - %H:%M:%S')})"
  end
end
