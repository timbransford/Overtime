require 'rails_helper'

context 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end

  describe "creation" do
    before do
      visit new_post_path
    end
    it "has a new form that can be reached" do
      expect(page.status_code).to eq(200)
    end

    it "can be createed from new form page" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "A rationale"

      click_on "Save"
      expect(page).to have_content("A rationale")
    end
  end

end
