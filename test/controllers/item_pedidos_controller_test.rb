require 'test_helper'

class ItemPedidosControllerTest < ActionController::TestCase
  setup do
    @item_pedido = item_pedidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_pedidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_pedido" do
    assert_difference('ItemPedido.count') do
      post :create, item_pedido: { item_id: @item_pedido.item_id, pedido_id: @item_pedido.pedido_id }
    end

    assert_redirected_to item_pedido_path(assigns(:item_pedido))
  end

  test "should show item_pedido" do
    get :show, id: @item_pedido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_pedido
    assert_response :success
  end

  test "should update item_pedido" do
    patch :update, id: @item_pedido, item_pedido: { item_id: @item_pedido.item_id, pedido_id: @item_pedido.pedido_id }
    assert_redirected_to item_pedido_path(assigns(:item_pedido))
  end

  test "should destroy item_pedido" do
    assert_difference('ItemPedido.count', -1) do
      delete :destroy, id: @item_pedido
    end

    assert_redirected_to item_pedidos_path
  end
end
