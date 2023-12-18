# frozen_string_literal: true
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create(email: 'admin@chudisoft.com', password: 'Admin_2023', fname: 'Admin Account', role: :admin)
User.create(email: 'user@chudisoft.com', password: 'User_2023', fname: 'User Account', role: :member)
User.create(email: 'user@chudisoft.com', password: 'User_2023', fname: 'User Account', role: :guest)
