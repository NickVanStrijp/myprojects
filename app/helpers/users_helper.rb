module UsersHelper
    
    #returns the gravitar for the given user.
    def gravatar_for(user)
       gravatar_id = Digest::MD5::hexdigest(user.user_email.downcase)
       gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
       image_tag(gravatar_url, alt: user.user_first_name, class: "gravatar")
    end
end
