user = User.create!(first_name: "Tim", last_name: "Brasnford", email: "asdf@asdf.com", 
                    password: "asdfasdf", password_confirmation: "asdfasdf")

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rational content", user_id: user.id)
end

puts "Created 100 Posts"
