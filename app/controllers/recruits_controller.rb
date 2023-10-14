class RecruitsController < ApplicationController
    
    before_action :authenticate_user!, only: [:new, :create]
    
    def top
      @recruits = Recruit.all
    end
    
    def about
    end

    def index
      if params[:search] != nil && params[:search] != ''
        #部分検索かつ複数検索
        search = params[:search]
        @recruits = Recruit.where("start_time LIKE ? OR place LIKE ?", "%#{search}%", "%#{search}%")
      else
        @recruits = Recruit.all
      end
    end
    
    def new
        @recruit = Recruit.new
    end
    
      def create
        recruit = Recruit.new(recruit_params)
        
        recruit.user_id = current_user.id
        
        if recruit.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
      
      def show
        @recruit = Recruit.find(params[:id])
        #@user=User.find(params[:id])
        #@currentUserEntry=Entry.where(user_id: current_user.id)
        #@userEntry=Entry.where(user_id: @user.id)
        #if @user.id == current_user.id
         # @msg ="他のユーザーとDMしてみよう！"
        #else
         # @currentUserEntry.each do |cu|
            #@userEntry.each do |u|
             # @roomId = cu.room_id
              #end
            #end
          #end
    
          #if @isRoom != true
           # @room = Room.new
            #@entry = Entry.new
          #end
    
        #end
      end
      
      def edit
        @recruit = Recruit.find(params[:id])
      end

      def update
        recruit = Recruit.find(params[:id])
        if recruit.update(recruit_params)
          redirect_to :action => "show", :id => recruit.id
        else
          redirect_to :action => "new"
        end
      end
      def destroy
        recruit = Recruit.find(params[:id])
        recruit.destroy
        redirect_to action: :index
      end
    
      private
      def recruit_params
        params.require(:recruit).permit(:place, :datetime, :level, :status, :comment, :start_time )
      end
    end