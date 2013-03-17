module ApplicationHelper

  def gravatar_image email
    hash = Digest::MD5.hexdigest email
    "http://www.gravatar.com/avatar/%s?s=24" % hash
  end

end
