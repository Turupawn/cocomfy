class OrderStatesController < ApplicationController
  before_action :set_order_state, only: [:show, :edit, :update, :destroy]

  # GET /order_states
  # GET /order_states.json
  def index
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end

    @order_states = OrderState.all
  end

  # GET /order_states/1
  # GET /order_states/1.json
  def show
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end
  end

  # GET /order_states/new
  def new
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end

    @order_state = OrderState.new
  end

  # GET /order_states/1/edit
  def edit
  end

  # POST /order_states
  # POST /order_states.json
  def create
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end

    @order_state = OrderState.new(order_state_params)

    respond_to do |format|
      if @order_state.save
        format.html { redirect_to @order_state, notice: 'Order state was successfully created.' }
        format.json { render :show, status: :created, location: @order_state }
      else
        format.html { render :new }
        format.json { render json: @order_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_states/1
  # PATCH/PUT /order_states/1.json
  def update
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end

    respond_to do |format|
      if @order_state.update(order_state_params)
        format.html { redirect_to @order_state, notice: 'Order state was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_state }
      else
        format.html { render :edit }
        format.json { render json: @order_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_states/1
  # DELETE /order_states/1.json
  def destroy
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end
    
    @order_state.destroy
    respond_to do |format|
      format.html { redirect_to order_states_url, notice: 'Order state was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_state
      @order_state = OrderState.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_state_params
      params.require(:order_state).permit(:name)
    end
end
