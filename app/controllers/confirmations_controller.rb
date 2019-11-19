class ConfirmationsController < ApplicationController
	def show
		usuario = Usuario.find_by(confirmation_token: params[:token])

		if usuario.present?
			usuario.confirm!
			redirect_to new_user_sessions_path,
			notice: I18n.t('confirmation.success')
		else
			redirect_to root_path
		end
		
	end
end