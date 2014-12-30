RailsAdmin.config do |config|

  ### Popular gems integration

  config.included_models = ["Company", "Function", "Team", 'Member', 'Project']
  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    config.model 'Company' do
      field :name
      configure :admin do
        field :name
      end
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  # require "rails_admin/application_controller"
  #
  # module RailsAdmin
  #   class ApplicationController < ::ApplicationController
  #     before_filter :require_site_admin
  #     include ActionController::HttpAuthentication
  #
  #   end
  # end

  config.authorize_with do
    authenticate_or_request_with_http_basic('Login required') do |username, password|
      Rails.logger.info "******always calling************"
      username == 'smadmin' &&
      password == 'password69'
    end
  end

end
