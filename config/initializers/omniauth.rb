Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?

  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']

  provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET'],
     { :scope => "userinfo.email", :approval_prompt => "auto" }

end
