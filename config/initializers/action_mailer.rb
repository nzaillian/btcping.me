ActionMailer::Base.smtp_settings = {
  :address              => Rails.application.secrets.smtp_address,
  :port                 => 587,
  :domain               => Rails.application.secrets.smtp_domain,
  :user_name            => Rails.application.secrets.smtp_user_name,
  :password             => Rails.application.secrets.smtp_password,
  :authentication       => :login,
  :enable_starttls_auto => true,
  :openssl_verify_mode => 'none'
}

Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?

Rails.application.routes.default_url_options[:host] = Rails.application.config.domain
Rails.application.config.action_mailer.default_url_options = {host: Rails.application.config.domain, only_path: false}

if ['test', 'development'].include?(Rails.env)
  Rails.application.config.action_mailer.default_url_options[:host] = "localhost:3000"
  Rails.application.config.action_mailer.asset_host = "http://localhost:3000"
end