require 'rails_helper'

RSpec.describe User, type: :model do

  describe "db schema" do
    context "columns" do
      it { should have_db_column(:name).of_type(:text)}
      it { should have_db_column(:email).of_type(:string) }
      it { should have_db_column(:encrypted_password).of_type(:string) }
    end
  end

  describe "associations" do
    it { should have_many(:albums)}
    it { should have_many(:pictures)}
    it { should have_many(:likes)}
    it { should have_many(:liked_pictures)}
    it { should have_many(:liked_albums)}
    it { should have_many(:following)}
    it { should have_many(:following_users)}
    it { should have_many(:follows)}
    it { should have_many(:followed_users)}
  end
end
