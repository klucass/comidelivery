class EnderecosController < ApplicationController
	before_action :require_authentication, only: [:new, :edit, :create, :update, :destroy]
  before_action :store_return_to

	# GET /enderecos
  	# GET /enderecos.json
  	def index
  	end

  # GET /enderecos/1
  # GET /enderecos/1.json
  def show    
  end

  # GET /enderecos/new
  def new
    @endereco = Endereco.new
  end

  # GET /endereco/1/edits  
  def edit
  end

  # POST /enderecos
  # POST /enderecos.json
  def create

  	@endereco = current_user.enderecos.build(endereco_params)

    respond_to do |format|
      if @endereco.save
        
        format.html { redirect_to account_path, notice: "Endereço salvo com sucesso."}
        format.json { render :show, status: :created, location:  account_path }
      else
        format.html { render :new }
        format.json { render json: @enderecos.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @endereco.update(endereco_params)
        format.html { redirect_to account_path, notice: 'Endereço atualizado com sucesso' }
        format.json { render :show, status: :ok, location: account_path }
      else
        format.html { render :edit }
        format.json { render json: @endereco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @endereco.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Endereço excluido com sucesso.' }
      format.json { head :no_content }
    end
  end

  	def endereco_params
		params.require(:endereco)
		.permit(:nome, :estado, :cidade, :logradouro, :endereco, :numero, :cep, :ponto_referencia)
	end

end