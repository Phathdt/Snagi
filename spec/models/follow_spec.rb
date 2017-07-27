require 'rails_helper'

RSpec.describe Follow , type: :model do

  describe "db schema" do
    context "columns" do
    	it { should have_db_column(:user_id).of_type(:integer)}
      it { should have_db_column(:followable_type).of_type(:string) }
      it { should have_db_column(:followable_id).of_type(:integer) }
    end
  end

  describe "association" do
    it { should belong_to(:user) }
    it { should belong_to(:followable) }
  end
end