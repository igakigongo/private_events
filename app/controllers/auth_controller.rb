class AuthController < ApplicationController
  def signin; end

  def authenticate
    # name_or_id = params[:name]
    if params.key?(:name) && (params[:name].nil? || params[:name].empty?)
      flash.now[:error] = 'please enter an ID or Name'
      render 'signin'
    else
      query = params[:name]
      user = User.where('id = ? or lower(name) = ?', query, query.downcase).first
      if user.nil?
        flash.now[:error] = 'Invalid ID or Name'
        render 'signin'
      else
        session[:current_user_id] = user.id
        flash[:success] = 'Welcome to the private events page'
        redirect_to user
      end
    end
  end

  def signout
    session.delete(:current_user_id)
    redirect_to events_path
  end
end
