class AppConfig
  include Singleton

  def application_config
    @config||= lambda{
        yaml = Pathname.new('config/application.yml')
        (YAML.load(ERB.new(yaml.read).result) || {})[Rails.env] || {}
    }.call
  end

  def gmail_user_name
    ENV['GMAIL_USER_NAME']
  end

  def gmail_user_password
    ENV['GMAIL_USER_PASSWORD']
  end

  def method_missing(*args)
    key = args[0]
    if key.is_a?(Symbol)
      return application_config[key.to_s]
    else
      return nil
    end
  end
end


def app_config
  AppConfig.instance
end