user = User.create!(first_name: "Tim", last_name: "Bransford", 
                    email: "timothybransford@gmail.com", 
                    password: "asdfasdf", password_confirmation: "asdfasdf")
user2 = User.create!(first_name: "Jon", last_name: "Snow",
                     email: "asdf@asdf.com",
                     password: "asdfasdf", password_confirmation: "asdfasdf")

100.times do |post|
  userid = post.odd? ? user.id : user2.id
  Post.create!(date: Date.today, rationale: "#{post} rational content", user_id: userid)
end

puts "Created 100 Posts with user connections"
