Clearance.configure do |config|
  config.mailer_sender = ENV['FROM_ADDRESS'] || 'reply@example.com'
end
