class ItemImagesController < ApplicationController
  before_action :set_item_image, only: [:show, :edit, :update, :destroy]

  # GET /item_images
  # GET /item_images.json
  def index
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end

    @item_images = ItemImage.all
  end

  # GET /item_images/1
  # GET /item_images/1.json
  def show
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end
  end

  # GET /item_images/new
  def new
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end

    @item_image = ItemImage.new
  end

  # GET /item_images/1/edit
  def edit
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end
  end

  # POST /item_images
  # POST /item_images.json
  def create
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end

    @item_image = ItemImage.new(item_image_params)

    respond_to do |format|
      if @item_image.save
        format.html { redirect_to @item_image, notice: 'Item image was successfully created.' }
        format.json { render :show, status: :created, location: @item_image }
      else
        format.html { render :new }
        format.json { render json: @item_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_images/1
  # PATCH/PUT /item_images/1.json
  def update
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end

    respond_to do |format|
      if @item_image.update(item_image_params)
        format.html { redirect_to @item_image, notice: 'Item image was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_image }
      else
        format.html { render :edit }
        format.json { render json: @item_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_images/1
  # DELETE /item_images/1.json
  def destroy
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end

    @item_image.destroy
    respond_to do |format|
      format.html { redirect_to item_images_url, notice: 'Item image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_image
      @item_image = ItemImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_image_params
      params.require(:item_image).permit(:item_id, :image)
    end
end
