# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


FUser.create!(
	name:"collaboro1",
	image:"",
	farm:"collaboro1農園",
	profile:"こだわりの生産方法でトマトやナスなどの夏野菜を中心に生産しています！！100年以上続く伝統ある農園です。",
	hp_url:"https://…..",
	email:"f@f",
	tell:"111111",
	post_code:"111111",
	address:"111111",
	conv_time:"12:00~13:00  16:00~18:00",
	password:"ffffff"
)

FUser.create!(
	name:"collaboro2",
	image:"",
	farm:"collaboro2果樹園",
	profile:"こだわりの生産方法でりんごやももを中心に生産しています！！長野の山にある果樹園です。",
	hp_url:"https://…..",
	email:"ff@ff",
	tell:"111111",
	post_code:"111111",
	address:"111111",
	conv_time:"12:00~13:00  16:00~18:00",
	password:"ffffff"
)

FUser.create!(
	name:"collaboro3",
	image:"",
	farm:"collaboro3農園",
	profile:"こだわりの生産方法でトマトやナスなどの夏野菜を中心に生産しています！！100年以上続く伝統ある農園です。",
	hp_url:"https://…..",
	email:"fff@fff",
	tell:"111111",
	post_code:"111111",
	address:"111111",
	conv_time:"12:00~13:00  16:00~18:00",
	password:"ffffff"
)

CUser.create!(
	name:"collaboro1",
	image:"",
	company:"collaboro1旅行会社",
	industry:"旅行",
	profile:"50代〜の男女向けのバスツアーを企画運営している旅行代理店です。",
	hp_url:"https://…..",
	email:"c@c",
	tell:"111111",
	post_code:"111111",
	address:"111111",
	conv_time:"9:00~18:00",
	password:"cccccc"
)
CUser.create!(
	name:"collaboro２",
	image:"",
	company:"collaboro２旅行会社",
	industry:"飲食店地元のケーキやを経営しているシェフですよ",
	profile:"50代〜の男女向けのバスツアーを企画運営している旅行代理店です。",
	hp_url:"https://…..",
	email:"cc@cc",
	tell:"111111",
	post_code:"111111",
	address:"111111",
	conv_time:"9:00~18:00",
	password:"cccccc"
)
CUser.create!(
	name:"collaboro3",
	image:"",
	company:"collaboro3旅行会社",
	industry:"旅行",
	profile:"50代〜の男女向けのバスツアーを企画運営している旅行代理店です。",
	hp_url:"https://…..",
	email:"ccc@ccc",
	tell:"111111",
	post_code:"111111",
	address:"111111",
	conv_time:"9:00~18:00",
	password:"cccccc"
)

12.times do |n|
	Blog.create!(
		f_user_id:rand(1..3),
		b_title:"test投稿",
		b_category:rand(0..3),
		b_body:"aaaaatesttestestestestestestestestesetestesteesあああああああ"
	)
end

3.times do |n|
	Proposal.create!(
		f_user_id:rand(1..3),
		start_season:"2019-09-01",
		finish_season:"2020-05-01",
		location:"東京都",
		title:"test投稿",
		category:rand(0..2),
		body:"aaaaatesttestestestestestestestestesetestesteesあああああああ"
	)
end
3.times do |n|
	Proposal.create!(
		f_user_id:rand(1..3),
		start_season:"2019-07-01",
		finish_season:"2020-05-01",
		location:"大阪府",
		title:"test投稿",
		category:rand(0..2),
		body:"aaaaatesttestestestestestestestestesetestesteesあああああああ"
	)
end
3.times do |n|
	Proposal.create!(
		f_user_id:rand(1..3),
		start_season:"2019-05-01",
		finish_season:"2019-05-01",
		location:"東京都",
		title:"test投稿",
		category:rand(0..2),
		body:"aaaaatesttestestestestestestestestesetestesteesあああああああ"
	)
end
4.times do |n|
	Proposal.create!(
		f_user_id:rand(1..3),
		start_season:"2019-01-01",
		finish_season:"2019-05-01",
		location:"北海道",
		title:"test投稿",
		category:rand(0..2),
		body:"aaaaatesttestestestestestestestestesetestesteesあああああああ"
	)
end

5.times do |n|
	Request.create!(
		c_user_id:rand(1..3),
		start_season:"2019-09-01",
		finish_season:"2020-05-01",
		title:"test投稿",
		location:"東京都",
		category:rand(0..2),
		body:"aaaaatesttestestestestestestestestesetestesteesあああああああ"
	)
end
2.times do |n|
	Request.create!(
		c_user_id:rand(1..3),
		start_season:"2019-03-01",
		finish_season:"2019-05-01",
		location:"東京都",
		title:"test投稿",
		category:rand(0..2),
		body:"aaaaatesttestestestestestestestestesetestesteesあああああああ"
	)
end
3.times do |n|
	Request.create!(
		c_user_id:rand(1..3),
		start_season:"2019-012-01",
		finish_season:"2020-05-01",
		location:"北海道",
		title:"test投稿",
		category:rand(0..2),
		body:"aaaaatesttestestestestestestestestesetestesteesあああああああ"
	)
end
3.times do |n|
	Request.create!(
		c_user_id:rand(1..3),
		start_season:"2019-06-01",
		finish_season:"2019-12-01",
		location:"北海道",
		title:"test投稿",
		category:rand(0..2),
		body:"aaaaatesttestestestestestestestestesetestesteesあああああああ"
	)
end
