module ApplicationHelper
  def gravatar_for(user, options = {size: 200})
    # get the email from URL-parameters or what have you and make lowercase
    email_address = user.email.downcase

    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    # compile URL which can be used in <img src="RIGHT_HERE"...
    image_src = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(image_src, alt: user.username, class: "rounded shadow mx-auto d-block")
  end
end
