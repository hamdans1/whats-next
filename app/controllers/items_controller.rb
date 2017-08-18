class ItemsController < ApplicationController
    
    def create
        @item = Item.new(item_params)
        @item.user = current_user
        
        if @item.save
            flash[:notice] = "You've added a new item."
            redirect_to current_user
        else
            flash[:alert] = "There was an error saving your item. Please try again."
            render :new
        end
    end
    
    private
    
    def item_params
        params.require(:item).permit(:name, :user)
    end
    
end
