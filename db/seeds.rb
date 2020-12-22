Role.create(name: :admin)
Role.create(name: :client)
user1 = User.create(username: 'paridhi',
								    email: 'paridhigupta787@gmail.com',
								    password: '123456',
								    password_confirmation: '123456')
user1.add_role(:admin)
user2 = User.create(username: 'purvi',
								    email: 'purvijeurkar123@gmail.com',
								    password: '123456',
								    password_confirmation: '123456')
user2.add_role(:client)
