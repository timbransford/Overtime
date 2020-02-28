require 'rails_helper'

describe Post, type: :model do
  context "Creation" do
    before do
      user = User.create(first_name:"first",last_name:"last",email: "asdf@asdf.com",
                         password:"asdfasdf",password_confirmation: "asdfasdf")
      @post = Post.create(date: Date.today, rationale: "Anything", user_id:user.id)
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

