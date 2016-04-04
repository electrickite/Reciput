Clearance.configure do |config|
  config.mailer_sender = ENV['FROM_ADDRESS'] || 'reply@example.com'
  config.allow_sign_up = false
end
