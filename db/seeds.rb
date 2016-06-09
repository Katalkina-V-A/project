# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
a = User.create(email:  "admin" , password:  "12345" , password_confirmation:  "12345", role: 4 )
a.activation_state = "active"
a.save


Building.create(name: "Корпус 1", address:  "Москворечье 2к1" , typebuild: [0], floor: 24, state: 0, quantityroom: 400)
Building.create(name: "Корпус 2", address:  "Москворечье 2к2" , typebuild:  [0] , floor:  24 , state:  0, quantityroom: 400)
Building.create(name: "Корпус 3", address:  "Москворечье 19к3" , typebuild:  [1] , floor:  5 , state:  0, quantityroom:  100)
Building.create(name: "Корпус 4", address:  "Москворечье 19к4" , typebuild:  [1] , floor:  5 , state:  0, quantityroom: 100)
Building.create(name: "Корпус 5", address:  "Кошкина 11к1" , typebuild:  [1,2] , floor:  6 , state:  1, quantityroom: 200)
Building.create(name: "Корпус 6", address:  "Шкулева 27ст2" , typebuild:  [1] , floor:  5 , state:  1, quantityroom: 150)
Building.create(name: "Корпус 7", address:  "Пролетарский проспект 8к2"  , typebuild: [1] , floor: 14 , quantityroom: 300)

Linen.create(building_id: 1, name: "Наволочка", quantity: 50)
Linen.create(building_id: 1, name: "Матрас", quantity: 50)
Linen.create(building_id: 1, name: "Пододеяльник", quantity: 50)
Linen.create(building_id: 1, name: "Простыня", quantity: 50)
Linen.create(building_id: 1, name: "Полотенце", quantity: 50)

Furniture.create(building_id: 1, name: "Стол письменный", quantity: 20)
Furniture.create(building_id: 1, name: "Стол кухонный", quantity: 20)
Furniture.create(building_id: 1, name: "Тумба", quantity: 20)
Furniture.create(building_id: 1, name: "Кровать", quantity: 20)
Furniture.create(building_id: 1, name: "Полна навесная", quantity: 20)

Room.create(building_id: 1, numb: 212, floor: 17, section: 1, place: 1,
  typeroom: 0, state: 0, fire: true, signal: true, samospas: nil, accessory: 1,
  accessoryfaculty: 3)
Room.create(building_id: 1, numb: 211, floor: 17, section: 1, place: 0,
  typeroom: 2, state: 0, fire: true, signal: true, samospas: nil, accessory: 1,
  accessoryfaculty: 3)
Room.create(building_id: 1, numb: 214, floor: 17, section: 1, place: 1,
  typeroom: 2, state: 0, fire: true, signal: true, samospas: nil, accessory: 1,
  accessoryfaculty: 3)
Room.create(building_id: 3, numb: 303, floor: 3, place: 0,
  typeroom: 4, state: 0, fire: true, signal: true, samospas: nil, accessory: 1,
  accessoryfaculty: 3)
Room.create(building_id: 3, numb: 305, floor: 3, place: 0,
  typeroom: 4, state: 0, fire: nil, signal: true, samospas: nil, accessory: 1,
  accessoryfaculty: 3)
