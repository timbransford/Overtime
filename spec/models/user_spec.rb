require 'rails_helper'

describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  context "Creation" do
   it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without first_name, last_name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end

  context "custom name methods" do
    it "has a full_name method" do
      expect(@user.full_name).to eq("first last")
    end

    it "has a full_name_last_first method" do 
      expect(@user.full_name_last_first).to eq("LAST, FIRST")
    end
  end
end
