# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all
Cat.create(name: "Penny", birth_date: "2007/06/01", color: "black", sex: 'F', description: 'Cutie pie!')
Cat.create(name: "Lara", birth_date: "2020/09/01", color: "grey", sex: 'F', description: 'Tiny!')