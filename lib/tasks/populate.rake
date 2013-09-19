namespace :populate do

  desc "Populates admins"
  task :admins => :environment do
    puts "Creating admins"
    AdminUser.create!(:email => 'steve@steveroettger.com', :password => 'sR03ttg3r12:)', :password_confirmation => 'sR03ttg3r12:)')
    AdminUser.create!(:email => 'abriening@gmail.com', :password => 'Password1', :password_confirmation => 'Password1')
    AdminUser.create!(:email => 'mcintosh.tim3@gmail.com', :password => 'Password1', :password_confirmation => 'Password1')
  end

  desc "Populates users"
  task :users => :load_factories do
    puts "Creating users"
    (ENV['USERS_COUNT'] || ENV['COUNT'] || 10).to_i.times do
      FactoryGirl.create(:user)
    end
  end

  desc "Populate projects"
  task :projects => :load_factories do
    puts "Creating projects"
    (ENV['PROJECTS_COUNT'] || ENV['COUNT'] || 10).to_i.times do
      FactoryGirl.create(:project)
    end
  end

  desc "Populate organizations"
  task :organizations => :load_factories do
    puts "Creating organizations"
    (ENV['ORGANIZATIONS_COUNT'] || ENV['COUNT'] || 10).to_i.times do
      FactoryGirl.create(:organization, name: "Red Cross", description: "Suspendisse urna metus, ornare id sagittis in, pulvinar quis elit. Etiam non tortor sem. Sed id orci vel lectus sodales vestibulum. Maecenas lacinia lacinia justo sollicitudin sagittis.")
    end
  end

  task :load_factories => :environment do
    gem 'factory_girl_rails'
    require 'factory_girl_rails'
  end
end

task :populate =>  %w[populate:admins populate:users populate:projects populate:organizations]

