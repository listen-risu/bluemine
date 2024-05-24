# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
project = Project.create({
    name: "テストプロジェクト",
    description: "Redmineを模したシステム開発テストプロジェクト",
    homepage: "",
    is_public: 1
})

hashed_password = BCrypt::Password.create('manager')
user = project.users.create({
    name: "manager",
    password: hashed_password,
    otp_secret: "",
    last_otp_at: ""
})

100.times do |count|
  issue = user.issues.create({
    title: "バグNo. #{count}",
    tracker: 1,
    description: "一部のユーザが認証をパスできなくなった",
    status: 1,
    priority: rand(3),
    category: 1,
    version: 1,
    files: nil,
    watcher: nil,
    start_at: DateTime.parse("2024/5/1"),
    end_at: DateTime.parse("2024/5/20"),
    estimated_man_month: 1,
    progress_rate: 30,
    project_id: project.id
  })
end