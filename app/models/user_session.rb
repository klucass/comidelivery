class UserSession
	include ActiveModel::Model

	attr_accessor :email, :password
	validates_presence_of :email, :password

	def initialize(session, attributes={})
		@session = session
		@email = attributes[:email]
		@password = attributes[:password]
	end

	def authenticate!
		usuario = Usuario.authenticate(@email, @password)
		if usuario.present?
			store(usuario)
		else
			errors.add(:base, :invalid_login)
			false
		end
	end
	
	def store(usuario)
		@session[:user_id] = usuario.id
	end

	def current_user
		Usuario.find(@session[:user_id])
	end

	def user_signed_in?
		@session[:user_id].present?		
	end

	def destroy
		@session[:user_id] = nil
	end

	def restaurante_do_usuario
		current_user.restaurante		
	end
end