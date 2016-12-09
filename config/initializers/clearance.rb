Clearance.configure do |config|
  config.mailer_sender = ENV['FROM_ADDRESS'] || 'reply@example.com'
  config.allow_sign_up = false
end

# Prevent Clearance controllers from running Pundit authorization checks
Rails.application.config.to_prepare do
  Clearance::BaseController.include ::DisablePolicyChecks
end
