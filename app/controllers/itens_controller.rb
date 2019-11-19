class ItensController < ApplicationController
	before_action :require_authentication, :require_have_restaurant, :categorias
	before_action :store_return_to

	def new
		@item = Item.new		
	end

	def show
		redirect_to painel_produtos_path
	end

	def create
		@item = current_user.restaurante.itens.build(item_params)

		respond_to do |format|
	    	if @item.save        
	        	format.html { redirect_to painel_produtos_path, notice: "Produto salvo com sucesso."}
	        	format.json { render :show, status: :created, location:  item_path }
	      	else
	        	format.html { render :new }
	        	format.json { render json: @item.errors, status: :unprocessable_entity }
	      	end      
  		end
	end

	def update
		@item = current_user.restaurante.itens.find(params[:id])

		if @item.update(item_params)
			redirect_to painel_produtos_path, notice: "Produto atualizado com sucesso"
		else
			render action: "edit"
		end
	end

	def edit
		@item = Item.find(params[:id])
	end

	def destroy
		@item = current_user.restaurante.itens.find(params[:id])
		
		@item.destroy

    	respond_to do |format|
      		format.html { redirect_to painel_produtos_path, notice: 'Produto excluido com sucesso.' }
      		format.json { head :no_content }
      	end
	end

	private

	def item_params
		params.require(:item)
		.permit(:nome, :descricao, :preco_centavos, :categoria_id)
	end

	def categorias
		@categorias = Categoria.all			
	end

end