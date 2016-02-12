class ItemsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @items = @user.items
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.name = params[:item][:name]
    @item.user = current_user

    if @item.save
      flash[:notice] = "Item was saved"
      redirect_to user_items_path(current_user)
    else
      flash.now[:alert] = "Error saving item try again"
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.name = params[:item][:name]

    if @item.save
      flash[:notice] = "item was updated"
      redirect_to user_items_path(current_user)
    else
      flash.now[:alert] = "error updating try again"
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item was deleted successfully."
    else
      flash.now[:alert] = "Error deleting item try again"
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end
