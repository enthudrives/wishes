Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '21a4e53be1df1fb8873a', '544b1dc2eea4376e17a19604da0a336cf9af2e73'
end