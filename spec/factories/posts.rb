FactoryBot.define do

  factory :post do
    date { Date.today }
    rationale { "A rationale" }
    user_id { user_id ||= FactoryBot.create(:user).id }
  end

  factory :another_post, class: "Post" do
    date { Date.today }
    rationale { "Another rationale" }
    user_id { user_id ||= FactoryBot.create(:user).id }
  end

end
