class ApplicationController < ActionController::Base
  helper_method :current_user

  protected

    def current_user
      if session[:current_user].nil?
        require 'securerandom'
        session[:current_user] = SecureRandom.uuid
      end

      @current_user ||= session[:current_user]
    end
end
