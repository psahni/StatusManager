namespace :app do

  desc "Add roles to database"
  task add_roles: :environment do
    ['Admin', 'SuperAdmin', 'Member', 'Manager'].each do |role|
      puts "Adding #{ role }"
      Role.create!(name: role)
    end
  end

#----------------------------------------------------------------------------------------------------------

  desc "This task will add some team members into database"
  task add_teams: :environment do
    ["CANRor", "Zoltar", "DBAs"].each do |team_name|
      puts "Adding #{ team_name }"
      Team.create!(name: team_name)
    end
  end

#----------------------------------------------------------------------------------------------------------

  desc "Create Team admin"
  task create_admins: :environment do

    #names = ['Mhaider', 'Shashi', 'Kuljeet']

    if !Role.admin.blank?
      Member.create!(name: 'Mhaider', email: 'mhaider@trantorinc.com', role_id: Role.super_admin.id,
                    team_id: Team.find_or_create_by(name: 'CANRor').id, company_id: Company.default_company.id)
      Member.create!(name: 'Shashi', email: 'shashi@trantorinc.com', role_id: Role.super_admin.id,
                    team_id: Team.find_or_create_by(name: 'Zoltar').id,company_id: Company.default_company.id)
      Member.create!(name: 'Kuljeet', email: 'kuljeet@trantorinc.com', role_id: Role.super_admin.id,
                    team_id: Team.find_or_create_by(name: 'DBAs'), company_id: Company.default_company.id)
    else
      puts "Please create roles first"
    end



  end

#----------------------------------------------------------------------------------------------------------



end