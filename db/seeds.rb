100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rational content")
end

puts "Created 100 Posts"
