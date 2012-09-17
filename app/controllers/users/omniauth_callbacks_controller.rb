# coding: utf-8
class Users::OmniauthCallbacksController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:google]
  
  def google
    access_token = request.env["omniauth.auth"]

    if access_token.info["email"] =~ /brains-tech.co.jp/
      @user = User.find_for_open_id(request.env["omniauth.auth"], current_user)
  
      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
  end

#  def google_oauth2
#    access_token = request.env["omniauth.auth"]
#    
#    if access_token.info["email"] =~ /brains-tech.co.jp/
#    
#      # You need to implement the method below in your model (e.g. app/models/user.rb)
#      @user = User.find_for_google_oauth2(access_token, current_user)
#
#      if @user.persisted?
#        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
#        sign_in_and_redirect @user, :event => :authentication
#      else
#        session["devise.google_data"] = request.env["omniauth.auth"]
#        redirect_to new_user_registration_url
#      end
#    else
#      redirect_to "/"
#    end
#  end
end
