# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create(username: 'user_1', password: '123456')

# Clear existing records
Project.destroy_all

# Create projects
projects = [
  {
    title: "Project 1",
    description: "Description for Project 1",
    details: "Details for Project 1",
    poster_img: "img1.jpg",
    technologies: ["React", "Redux", "CSS", "Tailwind"],
    features: ["feat1", "feat2", "feat3"],
    images: ["img1", "img2", "img3"],
    github_link: "https://github.com/project1",
    live_link: "https://project1.com"
  },
  {
    title: "Project 2",
    description: "Description for Project 2",
    details: "Details for Project 2",
    poster_img: "img2.jpg",
    technologies: ["Angular", "TypeScript", "SCSS"],
    features: ["feat4", "feat5", "feat6"],
    images: ["img4", "img5", "img6"],
    github_link: "https://github.com/project2",
    live_link: "https://project2.com"
  },
]

# Seed the projects
projects.each { |project| Project.create!(project) }

puts "Seed data has been created"
