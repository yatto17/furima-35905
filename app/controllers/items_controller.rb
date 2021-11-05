class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item_tag, only: [:edit, :update, :show, :destroy]
  before_action :sold_out_id, only: [:index, :show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item_tag = ItemTagForm.new
  end

  def create
    @item_tag = ItemTagForm.new(item_params)
    if @item_tag.valid?
      @item_tag.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item_tag = ItemTagForm.new(
                  images: @item.images,
                  name: @item.name,
                  info: @item.info,
                  price: @item.price,
                  category_id: @item.category_id,
                  sales_status_id: @item.sales_status_id,
                  shipping_fee_id: @item.shipping_fee_id,
                  prefecture_id: @item.prefecture_id,
                  scheduled_delivery_id: @item.scheduled_delivery_id,
                  user_id: @item.user_id,
                  tag_name: @tag
                )
  end

  def update
    @item_tag = ItemTagForm.new(update_params)
    if @item_tag.valid?
      @item_tag.update
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"])
    render json:{ keyword: tag }
  end

  private

  def item_params
    params.require(:item_tag_form).permit(:name, :info, :price, :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id,
                                 :scheduled_delivery_id, :tag_name, images: []).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:item_tag_form).permit(:name, :info, :price, :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id,
                                          :scheduled_delivery_id, :tag_name, images: []).merge(user_id: current_user.id, item_id: params[:id])
  end

  def set_item_tag
    @item = Item.find(params[:id])
    @tag = @item.tags[0][:tag_name]
  end

  def move_to_index
    redirect_to root_path if @item.user_id != current_user.id || @purchases.include?(@item.id)
  end

  def sold_out_id
    @purchases = Purchase.pluck(:item_id)
  end
end
