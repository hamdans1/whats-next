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
    
    def destroy
        @item = current_user.items.find(params[:id])
        
        if @item.destroy
            flash[:notice] = "item Completed!"
        else
            flash.now[:alert] = "There was an error completing this task"
        end
        
        respond_to do |format|
            format.html {redirect_to 'user#show'}
            format.js {render :layout => false}
        end

    end
    
    private
    
    def item_params
        params.require(:item).permit(:name, :user)
    end
    
end
