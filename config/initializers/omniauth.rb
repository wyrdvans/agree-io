Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?

  # provider :google_oauth2, ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"]
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']

  provider :google_oauth2,
    "554097319172-0iuib0a1peig6lhg5nfa18mcv6njpp9h.apps.googleusercontent.com",
    "7uYU-QXFf_RVMgruIhrBcwbS",  { :scope => "userinfo.email", :approval_prompt => "auto" }

end
