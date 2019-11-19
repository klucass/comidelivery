class Usuario < ActiveRecord::Base
	
	validates_presence_of :nome, message: "deve ser preenchido"
	validates_presence_of :email, message: "deve ser preenchido"
	validates_presence_of :telefone, message: "deve ser preenchido"
	validates_uniqueness_of :email, message: "email já cadastrado"
	has_one :restaurante
	has_many :enderecos
	has_many :pedidos

	has_secure_password

	before_create do |usuario|
		usuario.confirmation_token = SecureRandom.urlsafe_base64
	end

	def confirm!
		return if confirmed?

		self.confirmed_at = Time.current
		self.confirmation_token = ''
		save!
			
	end


	def confirmed?
		confirmed_at.present?		
	end

	scope :confirmed, -> {where.not(confirmed_at: nil)}

	def self.authenticate(email, password)
		#para autenticar apenas usuários com email confirmado, usar confirmed.find_by(email: email)
		usuario = Usuario.find_by(email: email).
			try(:authenticate, password)		
	end
end
