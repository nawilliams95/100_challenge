class GiftsController < ApplicationController

    #==================
    #Index
    #==================
    def index 
        @gifts = Gift.all.order('id ASC')
        render json: {status: 200, gifts: @gifts }
    end

    #=================
    #show
    #=================
    def show
        @found_gift = Gift.find(params[:id])
        render json: {status: 200, gift: @found_gift}
    end 

    #===============
    #Create
    #===============
    def create 
        @gift = Gift.new(gift_params)

        if @gift.save
            render json: {status: 201, gift: @gift}
        else
            #Unsaved or unprocessed entry
            render json: {status: 422, gift: @gift}
        end
    end

    #================
    #Update
    #================
    def update 
        @gift = Gift.find(params[:id])
        @gift.update(gift_params)
        # if  
        #     reder json: {status 201, gift: @gift}
        # else 
        #    #Unupdated or unprocessed entry
        #    render json: {status 422, gift: @gift}
        # end
    end

    #=================
    #Destroy
    #=================
    def destroy 
        @gift = Gift.destroy(params[:id])
        render json: {status: 204}
    end

    #==================
    #Random
    #==================
    def random 
        @random_gift = Gift.all.sample
        render json: {status: 200, random_gift: @random_gift}
    end

    private 

        def gift_params
            params.required(:gift).permit(:name, :value, :event, :gift_giver)
        end
end
