class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  include OrdersHelper
  include ClientsHelper
  def list_items
    @order = Order.find(params[:id])
    @items = @order.item
  end

  # GET /orders or /orders.json
  def index
    # @orders = Order.all
    client_id = @last_client
    @orders = Order.where(params[client_id: client_id])
    @client_orders = @orders
  end

  # def client_user
  #   @client_orders = current_user.client.orders
  # end
  # GET /orders/1 or /orders/1.json
  def show
    @order_items = OrderItem.where(order_id: params[:id])
    total = 0
    @order_items.each do |order_item|
      if order_item.status != 'cancelado'
        total += order_item.preco_unitario
      end
    end
    @order = Order.find(params[:id])
    @order.update({valor_total: total})
  end

  def set_status
    @status = params[:status]
    @order_item = OrderItem.find(params[:id])
    update_value = {status: @status.to_i}
    @order_item.update(update_value)
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:valor_total, :status, :numero_mesa, :item_id, :client_id)
  end
end
