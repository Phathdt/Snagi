require 'rails_helper'

RSpec.describe Picture, type: :model do

  describe "db schema" do
    context "columns" do
    	it { should have_db_column(:album_id).of_type(:integer)}
      it { should have_db_column(:title).of_type(:text) }
      it { should have_db_column(:description).of_type(:text) }
      it { should have_db_column(:is_private).of_type(:boolean) }
    end
  end

  describe "validations" do
    it { should validate_presence_of(:image_file_name) }
    it { should validate_presence_of(:image_content_type) }
  end
end