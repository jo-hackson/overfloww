require 'faker'

# user profile pictures
profile_pictures = [
"https://s-media-cache-ak0.pinimg.com/564x/d6/f7/b1/d6f7b1a9cd0c1a4a31c76a1d674a8e36.jpg",
"https://s-media-cache-ak0.pinimg.com/564x/e3/4c/63/e34c636a59d8b32a9d62edbd900da9a4.jpg",
"https://s-media-cache-ak0.pinimg.com/736x/37/5c/e8/375ce83551aafaec5f2d5ffef338b2fa--pixel-art-minecraft.jpg",
"https://s-media-cache-ak0.pinimg.com/564x/ed/d7/a8/edd7a88bfd09eed359eea17f2a0467dd.jpg",
"http://img15.deviantart.net/88dc/i/2011/255/4/f/siege_by_cowbyte-d49p4q5.jpg",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm8YMaPXhEsGfbyqqY5lDfa5azKAy5AvF47YrHbsQsCCiKiPKLDg",
"https://pldh.net/media/dreamworld/108.png",
"https://vignette4.wikia.nocookie.net/pokemon/images/b/b7/079Slowpoke_Dream.png/revision/latest?cb=20140820072339",
"http://wallpapercave.com/wp/aJCzeTw.png",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREGgXKvlX7VE4nt4bUcP0mAq5l5r_yfAh-Wt8JIw4YHezo0gukhw"
]

# def randomizer
#   index = 
#   return profile_pictures[rand(0..6)]
# end

tags = ["ruby", "javascript", "pry", "jquery", "stumped", "programming", "python"]

tags.each do |tag|
  Tag.create!( :name => tag )
end



users = 5.times.map do
  User.create!( :first_name => Faker::Name.first_name,
                :last_name  => Faker::Name.last_name,
                :username   => Faker::Hipster.words(2).join(""),
                :email      => Faker::Internet.email,
                :password   => '123123',
              )
end

questions = 15.times.map do
  Question.create!( :title => Faker::Hipster.words(3).join(" "),
                    :body => Faker::Hipster.paragraph(6),
                    :user_id => rand(1..5)
    )
end

questions.map do |question|
  question.comments.create!(  :body => Faker::HarryPotter.quote,
                              :user_id => rand(1..5),
  )
end

# x.comments.create!(:body => Faker::HarryPotter.quote, :user_id => rand(1..5))

answers = 50.times.map do
    Answer.create!( :body => Faker::TwinPeaks.quote,
                    :user_id => rand(1..5),
                    :question_id => rand(1..15)
    )
end

answers.map do |answer|
  answer.comments.create!(  :body => Faker::HarryPotter.quote,
                              :user_id => rand(1..5),
  )
end

questions.each do |question|
  question.votes.create!( :user_id => rand(1..5)
  )
end

answers.each do |answer|
  answer.votes.create!( :user_id => rand(1..5)
  )
end

questiontags = 20.times.map do 
  Questiontag.create!( :tag_id => rand(1..7),
                       :question_id => rand(1..15)
                     )
end