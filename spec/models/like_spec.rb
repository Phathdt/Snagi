require 'rails_helper'

RSpec.describe Like, type: :model do

  describe "db schema" do
    context "columns" do
    	it { should have_db_column(:user_id).of_type(:integer)}
      it { should have_db_column(:likeable_type).of_type(:string) }
      it { should have_db_column(:likeable_id).of_type(:integer) }
    end
  end
end