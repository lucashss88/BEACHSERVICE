class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  before_action :load_items, only: [:index]
  # before_action :require_admin
  def menu
    render 'items/index'
  end
  # GET /items or /items.json
  def index
    if params[:category_id]
      @items = Item.where(category_id: params[:category_id]).page(params[:page]).per(10)
    else
      @items = Item.all.page(params[:page]).per(21)
    end

    @categories = Category.all
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
    @item.build_category
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # def require_admin
  #   # code here
  #   unless current_admin
  #       redirect_to root_path, alert: 'Você precisa fazer login como administrador'
  #     end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # def require_login
    #   unless session[:client_id]
    #     redirect_to login_clients_path, alert: 'Você precisa fazer login'
    #   end
    # end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:nome, :preco_unitario, :descricao, :quantidade, :category_id)
    end

  # Inserindo o cache em memória
  def load_items
    # Buscando os intens em cache
    cached_items = Rails.cache.read('all_items')

    unless cached_items
      # Se o cache não existe, consulte o banco de dados
      if params[:category_id]
        items = Item.where(category_id: params[:category_id]).page(params[:page]).per(10)
      else
        items = Item.all.page(params[:page]).per(21)
      end
      # Armazena os itens em um objeto serializável, como um array
      cached_items = items.to_a

      # Armazena esse objeto em cache
      Rails.cache.write('all_items', cached_items)
    end

    @items = cached_items
  end

end
