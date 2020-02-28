FactoryBot.define do

  factory :user do
    first_name {"first"}
    last_name {"last"}
    email { "firstlast@example.com" }
    password { "asdfasdf" }
    password_confirmation { "asdfasdf" }
  end

  factory :admin_user, class: "AdminUser" do
    first_name {"Admin"}
    last_name {"User"}
    email { "admin@example.com" }
    password { "asdfasdf" }
    password_confirmation { "asdfasdf" }
  end

end
