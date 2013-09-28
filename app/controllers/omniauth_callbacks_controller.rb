class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    auth = request.env["omniauth.auth"]
    session["linkedin.access"] = { token: auth.extra.access_token.token,
                                   secret: auth.extra.access_token.secret }
    user = User.from_omniauth(auth)
    if user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes.merge(remote_image_url: user.remote_image_url)
      redirect_to new_user_registration_url
    end
  end
  alias_method :linkedin, :all
end
