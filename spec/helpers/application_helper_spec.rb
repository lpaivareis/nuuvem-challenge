require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#import_title' do
    let(:import) { create(:import_file) }

    it 'returns a string with the import created_at' do
      expect(helper.import_title(import)).to eq("Arquivo importado em (#{import.created_at.strftime('%d/%m/%Y - %H:%M:%S')})")
    end
  end
end
