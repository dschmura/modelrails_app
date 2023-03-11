class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:shibboleth, :google_oauth2]
  has_many :omni_auth_services, dependent: :destroy
  has_one_attached :avatar       

  def image_url
     GravatarHelper.gravatar_url_for(email)
  end

end
