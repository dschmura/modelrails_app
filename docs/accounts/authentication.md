# Authentication:
[Home](./README.md) / [Accounts](accounts/README.md) / [Requesting Access](accounts/requesting_access.md)

ModelRails supports three modes of authentication; Shibboleth , GoogleOAuth and Active Directory. Utilizing these methods allows us to provide authentication without storing passwords in our applications.

>  **Important:** *Never store passwords in the application database unless it cannot be avoided. Utilize OAuth (Google, SAML, etc...) instead. **Encrypt all the things!!!***

These methods of authentication can be used individually or in conjunction with one another, depending on the use case. Users can choose which every login method they prefer to use (provided the application is configured to support it), and the application will log them into the same personal account. This is convenient if a user forgets which one to use with which app. 

> Determining permissions based on the manner with which a user signed in is **strongly discouraged**! *Avoiding this approach allows us to change the login options in the future without having to rewrite a bunch of code.*




### GoogleOAuth
  GoogleOAuth can be used as a Single Sign On option, and logins can be restricted to the umich.edu domain or a sub-domain such as lsa.umich.edu. 

  This option is the easiest to implement since it does not require coordination with other teams. (Developers can set this method up without engaging a human.)

1.) uncomment the gem and bundle
```gem "omniauth-google-oauth2"```

2.) add credentials for the environment you are working on. 
```EDITOR="code --wait" bin/rails credentials:edit --environment=development```

```
google_oauth2:
  app_id: YOUR_GOOGLE_OAUTH_APP_ID
  app_secret: YOUR_GOOGLE_OAUTH_APP_SECRET
```

3.) Uncomment the following line in the config/initializers/devise.rb file.

```  
  config.omniauth :google_oauth2, Rails.application.credentials.google_oauth2[:APP_ID],
    Rails.application.credentials.google_oauth2[:APP_SECRET], scope: "userinfo.email, userinfo.profile", prompt: "select_account", image_aspect_ratio: "square", image_size: 50, hd: %w[umich.edu lsa.umich.edu]
```

4.) Add 'google_oauth2' to the omniauth_providers array in app/models/user.rb

```omniauth_providers: [:saml, :google_oauth2]```

### Saml 

1.) uncomment the gem and bundle
```gem "omniauth-saml"```

>> Reference [How to set up SAML](https://github.com/lsa-mis/modelrails_playbook/wiki/1.5b-Shibboleth-Setup-Using-OmniAuth-SAML)


2.) add credentials for the environment(s) you are working on. 
```EDITOR="code --wait" bin/rails credentials:edit --environment=development```

  [Sample Saml Config](https://github.com/lsa-mis/modelrails_playbook/wiki/1.5bs-Sample-Saml-Credential.)

3.) Uncomment the saml configuration section in the config/initializers/devise.rb file. Look for the line that starts with.

```  # config.omniauth :saml```


4.) add 'saml' to the omniauth_providers array in app/models/user.rb

```omniauth_providers: [:saml, :google_oauth2]```

### Shibboleth 
  == link to shibboleth documentation

### Active Directory{} 
  == link to Active Directory documentation 

<img 
  style="display: block; 
          margin-left: auto;
          margin-right: auto;
          width: 20%;"
  src="https://markdown.land/wp-content/uploads/2021/06/markdown-512px.png" 
  alt="Our logo">
</img>