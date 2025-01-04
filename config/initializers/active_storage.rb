Rails.application.config.active_storage.resolve_model_to_route = :rails_storage_proxy

Rails.application.config.to_prepare do
  ActiveStorage::Current.url_options = Rails.application.routes.default_url_options
end
