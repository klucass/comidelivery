class ItemPedidosController < ApplicationController
  include CurrentPedido
  before_action :set_pedido, only: [:create]
  before_action :set_item_pedido, only: [:show, :edit, :update, :destroy]


  # GET /item_pedidos
  # GET /item_pedidos.json
  def index
    @item_pedidos = ItemPedido.all
  end

  # GET /item_pedidos/1
  # GET /item_pedidos/1.json
  def show
  end

  # GET /item_pedidos/new
  def new
    @item_pedido = ItemPedido.new
  end

  # GET /item_pedidos/1/edit
  def edit
  end

  # POST /item_pedidos
  # POST /item_pedidos.json
  def create
    item = Item.find(params[:item_id])
    
    #add_item definido no model pedido
    @item_pedido = @pedido.add_item(item.id)
    pedido = @item_pedido.pedido



    respond_to do |format|
      if @item_pedido.save

        # Primeiro item do pedido: adiciona restaurante_id ao pedido
        if not pedido.restaurante_id
          pedido.restaurante_id = item.restaurante.id
        end

        pedido.save
        format.html { redirect_to item.restaurante, notice: 'Produto adicionado ao seu pedido.' }
        format.js { @current_item = @item_pedido }
        format.json { render :show, status: :created, location: @item_pedido }
      else
        format.html { render :new }
        format.json { render json: @item_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_pedidos/1
  # PATCH/PUT /item_pedidos/1.json
  def update
    respond_to do |format|
      if @item_pedido.update(item_pedido_params)
        format.html { redirect_to @item_pedido, notice: 'Produto atualizado.' }
        format.json { render :show, status: :ok, location: @item_pedido }
      else
        format.html { render :edit }
        format.json { render json: @item_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_pedidos/1
  # DELETE /item_pedidos/1.json
  def destroy
    @item_pedido.destroy
    respond_to do |format|
      format.html { redirect_to @item_pedido.item.restaurante , notice: 'Produto removido do pedido.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_pedido
      @item_pedido = ItemPedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_pedido_params
      params.require(:item_pedido).permit(:item_id, :pedido_id)
    end
end
