RspecApiDocumentation.configure do |config|
  # Output folder
  config.docs_dir = Rails.root.join("doc", "api")
  # An array of output format(s).
  # Possible values are :json, :html, :combined_text, :combined_json,
  #   :json_iodocs, :textile, :markdown, :append_json
  config.format = [:json]
end