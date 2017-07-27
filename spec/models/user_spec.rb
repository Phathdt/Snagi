require 'rails_helper'

RSpec.describe User, type: :model do

  describe "db schema" do
    context "columns" do
    	it { should have_db_column(:name).of_type(:text)}
      it { should have_db_column(:email).of_type(:string) }
      it { should have_db_column(:encrypted_password).of_type(:string) }
    end
  end
end