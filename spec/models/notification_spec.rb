require 'rails_helper'

RSpec.describe Notification, type: :model do

  describe "db schema" do
    context "columns" do
    	it { should have_db_column(:user_id).of_type(:integer)}
      it { should have_db_column(:content).of_type(:text) }
      it { should have_db_column(:user_has_id).of_type(:integer) }
      it { should have_db_column(:object_id).of_type(:integer) }
      it { should have_db_column(:is_readed).of_type(:boolean) }
    end
  end
end