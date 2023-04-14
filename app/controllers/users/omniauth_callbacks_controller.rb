class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :set_omni_auth_service
  before_action :set_user

  attr_reader :omni_auth_service, :user

  def facebook
    handle_auth "Facebook"
  end

  def twitter
    handle_auth "Twitter"
  end

  def github
    handle_auth "Github"
  end

  def google_oauth2
    handle_auth "Google"
  end

  def saml
    handle_auth "Saml"
  end

  private

  def handle_auth(kind)
    omni_auth_service_login
    connect_omni_auth_service(kind)
  end

  def omni_auth_service_login
    if omni_auth_service.present?
      omni_auth_service.update(omni_auth_service_attrs)
    else
      user.omni_auth_services.create(omni_auth_service_attrs)
    end
  end

  def connect_omni_auth_service(kind)
    if user_signed_in?
      flash[:notice] = "Your #{kind} account was connected."
      redirect_to edit_user_registration_path
    else
      sign_in_and_redirect user, event: :authentication
      set_flash_message :notice, :success, kind:
    end
  end

  def user_is_stale?
    return unless user_signed_in?

    current_user.last_sign_in_at < 15.minutes.ago
  end

  def auth
    request.env["omniauth.auth"]
  end

  def set_omni_auth_service
    @omni_auth_service = OmniAuthService.where(provider: auth.provider, uid: auth.uid).first
  end

  def set_user
    if user_signed_in?
      @user = current_user
    elsif omni_auth_service.present?
      @user = omni_auth_service.user
    elsif User.where(email: auth.info.email).any?
      # 5. User is logged out and they login to a new account which doesn't match their old one
      flash[:alert] =
        "An account with this email already exists. Please sign in with that account before connecting your #{auth.provider.titleize} account."
      redirect_to new_user_session_path
    else
      @user = create_user
    end
  end

  def omni_auth_service_attrs
    expires_at = auth.credentials.expires_at.present? ? Time.at(auth.credentials.expires_at) : nil
    {
      provider: auth.provider,
      uid: auth.uid,
      expires_at:,
      access_token: auth.credentials.token,
      access_token_secret: auth.credentials.secret
    }
  end

  def create_user
    user = User.create(
      email: auth.info.email,
      # name: auth.info.name,
      password: Devise.friendly_token[0, 20]
    )
    create_user_services(user)
  end

  def create_user_services(user)
    user.omni_auth_services.create(
      provider: auth.provider,
      uid: auth.uid,
      expires_at: Time.at(auth.credentials.expires_at),
      access_token: auth.credentials.token
    )
  end
end
