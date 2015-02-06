require 'faker'
require "securerandom"
namespace :db do
  desc "Populate a database with fake data"
  task :populate => :environment do
    count = 20
    if !User.where(:email => "punisher@example.com").first
      uuid = SecureRandom.hex
      User.create!(:email => "punisher@example.com", encrypted_password: "PUNISHER", 
        password: "PUNISHER", :uuid => uuid)
      MinecraftUsername.create!(:username => "ThePunisher", :uuid => uuid)
    end
    @punisher = User.find_by(:email => "punisher@example.com")
    count.times do
      uuid = SecureRandom.hex
      pass = Faker::Internet.password
      username = Faker::Internet.user_name[0..13] + rand(100).to_s
      user = User.create!(:email => Faker::Internet.email, encrypted_password: pass, 
        password: pass, :uuid => uuid)
      MinecraftUsername.create!(:username => username, :uuid => uuid)
      Punishment.create!(:punishment_type => "Ban", :expires_at => Time.now + 3.days, 
        :punished_at => Time.now, :punisher => @punisher.get_username.uuid,
        :punished => user.get_username.uuid, :reason => "This is a test punishment!")

      18.times do
        death = Death.create(:victim_uuid => user.get_username.uuid, 
          :killer_uuid => @punisher.get_username.uuid,
          :server_session_id => 1, :weapon => "Sword", :timestamp => Time.now,
          :gamemode => "Factions")
      end
      puts "Created user #{username}."
    end
  end
end