Rails.application.configure do
  return unless defined?(Lograge)

  config.lograge.formatter = Lograge::Formatters::Logstash.new
  config.lograge.base_controller_class = 'ActionController::API'
  config.lograge.custom_payload do |controller|
    {
      host: controller.request.host,
      ip: controller.request.ip,
      user_agent: controller.request.env['HTTP_USER_AGENT'],
      request_id: controller.request.request_id
    }
  end
end
