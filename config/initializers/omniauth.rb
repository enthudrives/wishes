Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '21a4e53be1df1fb8873a', '544b1dc2eea4376e17a19604da0a336cf9af2e73' if Rails.env.development?
  provider :github, '4910999bb952e346cd54', '11e4cd12861a3cb169b3cff584f0542fb70fa307' if Rails.env.production?
end