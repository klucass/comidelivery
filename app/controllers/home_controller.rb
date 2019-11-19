class HomeController < ApplicationController
	def index
	end

	def suporte
		render 'suporte'
	end

	def cadastro_restaurante #exibe a página de precadastro com formulário
		@precadastro = Precadastro.new

		render 'cadastro_restaurante'
	end

	def precadastro #recebe e processa os dados inseridos no formulário de precadastro
		@precadastro = Precadastro.new(precadastro_params)
		if @precadastro.save
         UserNotifier.send_precadastro_email(@precadastro).deliver
			render 'sucesso'
		else
			redirect_to cadastro_restaurante notice: "Não deu certo, tente de novo :("
		end
	end

   def precadastro_sucesso
      render 'sucesso'
   end

	private

    def precadastro_params
    	params.require(:precadastro)
		.permit(:nome, :telefone, :email)

    end
end
