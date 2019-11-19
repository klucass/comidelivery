class UserSessionsController < ApplicationController
	before_action :require_no_authentication, only: [:new, :create]
	before_action :require_authentication, only: [:destroy]
	def new
		@user_session = UserSession.new(session)
		@back_to = params[:back_to]
		
	end
	def create
		@user_session = UserSession.new(session, params[:user_session])
		if @user_session.authenticate!
			
			redirect_back_or_default(root_path)

		else
			render :new
		end
	end

	def destroy
		user_session.destroy
		redirect_to root_path, notice: t('flash.notice.signed_out')		
	end

	private

	def redirect_back_or_default(default)
    	redirect_to(session[:return_to] || default)
    	session[:return_to] = nil
	end
	
end