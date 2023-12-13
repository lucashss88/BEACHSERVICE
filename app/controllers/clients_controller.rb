class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]
  # before_action :require_login, except: [:login]

  # GET /clients or /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1 or /clients/1.json
  def show
  end

  # def login
  #   @client = Client.find_by(nome: params[:client][:nome], email: params[:client][:email])
  #   if @client
  #     session[:client_id] = @client.id
  #     redirect_to items_path, notice: 'Login bem-sucedido'
  #   else
  #     flash[:alert] = 'Nome ou email incorretos'
  #     render 'new'
  #   end
  # end

  # GET /clients/new
  def new
    @id = params[:id]
    cookies[:numero_mesa] = {value: @id, expires:20.hours.from_now, httponly: true}
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)
    respond_to do |format|
      if @client.save
        @order = Order.new({
          client_id: @client.id,
          numero_mesa: cookies[:numero_mesa]
        })
        @order.save

        format.html { redirect_to "/items", notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to client_url(@client), notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def last_client
    @last_client = @clients.last
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # def require_login
    #   unless session[:client_id]
    #     redirect_to login_clients_path, alert: 'Você precisa fazer login'
    #   end
    # end

    # # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:nome, :email, :telefone)
    end
end
