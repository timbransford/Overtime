require 'rails_helper'

describe Post, type: :model do
  context "Creation" do
    before do
      @post = FactoryBot.create(:post)
    end
    it "can be created" do
      expect(@post).to be_valid
    end

    it "cannot be created without a date" do
      @post.date = nil
      expect(@post).to_not be_valid
    end

    it "cannot be created without a rationale" do
      @post.rationale = nil
      expect(@post).to_not be_valid
    end
  end
end

