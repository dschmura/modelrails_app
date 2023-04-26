module SignInHelper
  def sign_in_with(provider)
    "Sign in with #{OmniAuth::Utils.camelize(provider)}"
  end
end
