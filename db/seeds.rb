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
  Team.create(:name => team, :description => team)
end
