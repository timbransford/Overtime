require 'rails_helper'

context 'navigate' do

  before do
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
  end

  describe 'index' do

    before do
      visit posts_path
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      post1 = FactoryBot.create(:post, user_id: @user.id)
      post2 = FactoryBot.create(:another_post, user_id: @user.id)
      
      visit posts_path
      expect(page).to have_content(post1.rationale)
      expect(page).to have_content(post2.rationale)
    end

  end

  describe "creation" do

    before do
      visit new_post_path
    end

    it "has a new form that can be reached" do
      expect(page.status_code).to eq(200)
    end

    it "can be created from new form page" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "A rationale"

      click_on "Save"
      expect(page).to have_content("A rationale")
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User_Association"
      click_on "Save"

      expect(@user.posts.last.rationale).to eq("User_Association")
    end
  end

  describe "new" do
    before do
      visit root_path
      click_link "new_post_from_nav"
    end

    it "has a link from home page" do
      expect(page.status_code).to eq(200)
    end
    
    it "has proper header" do
      expect(page).to have_content("New Time Entry")
    end
  end

  describe "edit" do

    before do
      @post = FactoryBot.create(:post, user_id:@user.id)
      visit posts_path
      click_link "edit_#{@post.id}"
    end
    
    it "can be reached by clicking edit on index page" do
      expect(page.status_code).to eq(200)
      expect(page).to have_content("Edit Time Entry")
    end

    it "has the correct post to edit" do
      expect(page).to have_content(@post.rationale)
    end

    it "updates content" do
      fill_in 'post[rationale]', with: "Changed Rationale"
      click_on "Save"

      expect(page).to have_content("Changed Rationale")
    end


  end

end
