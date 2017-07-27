require 'rails_helper'

RSpec.describe Album, type: :model do

  describe "db schema" do
    context "columns" do
    	it { should have_db_column(:user_id).of_type(:integer)}
      it { should have_db_column(:title).of_type(:text) }
      it { should have_db_column(:description).of_type(:text) }
      it { should have_db_column(:quality).of_type(:integer) }
      it { should have_db_column(:is_private).of_type(:boolean) }
    end
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_numericality_of(:quality)}
    # it { should validate_inclusion_of(:is_private).in_array([true, false])}
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:pictures) }
    it { should have_many(:likes)}
    it { should have_many(:liked_users)}
    it { should have_many(:follows)}
    it { should have_many(:followed_users)}
  end
end