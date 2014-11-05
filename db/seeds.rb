# Company
Company.where(name: 'Trantor Inc').first_or_create(name: 'Trantor Inc', email: 'moin.haidar@trantorinc.com')

# Roles
['Admin', 'Super Admin', 'Project Co-ordinator', 'Project Manager', 'Team Lead', 'Member'].each do |role|
  Role.create(:name => role, :active => true)
end

# Activities
['Code', 'Design', 'Admin', 'Database', 'Unit Test', 'Timebox', 'Meeting', 'Automation', 'Test Design', 'Deployment', 'Documentation', 'Analysis', 'Training'].each do |activity|
  Activity.create(:name => activity)
end

# Teams
[
  'DIGITAL E2E',
  'EIS MAINTENANCE',
  'BI',
  'QTP AUTOMATION',
  'TECHNICAL WRITERS',
  'PROJECT CORDINATION',
  'EXCLUSIVITY 15',
  'ZOLTAR',
  'Sales Portal',
  'DBA',
  'Omega & Partner Portal (ROR)',
  'Secondary Duplicate check',
  'Deployment Tool',
  'Sales on Boarding',
  'Modify Authorized Owner Logic for CAN Capital APIs',
  'Integration Digital E2E and CAN Connect',
  'CRM',
  'EIS LITE',
  'OUTLOOK AGENTS'
].each do |team|
  Rails.logger.info "Creating seed team : #{team}"
  Team.create(:name => team, :description => team)
  Rails.logger.info "Created seed team : #{team}"
end

# Manager
admin_role = Role.find_by_name('Admin').id rescue nil

Member.where(name: 'Gurdeep Singh').first_or_create(
  name: 'Gurdeep Singh', 
  role_id: admin_role,
  email: 'gurdeep.singh1@trantorinc.com',
  gender: 'Male',
  designation: 'Project Manager'
)

# Members
[
  ['Moin Haidar', 'moin.haidar@trantorinc.com'], 
  ['Prashant Sahni', 'prashant.sahni@trantorinc.com'], 
  ['Nishutosh Sharma', 'nishutosh.sharma@trantorinc.com']
].each do |member|
  Member.where(name: member).first_or_create(
    name: member.first,
    role_id: admin_role,
    email: member.last,
    gender: 'Male',
    designation: 'Change Me'
  )
end
