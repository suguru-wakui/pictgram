class TopicsController < ApplicationController
    def index
      @topics = Topic.all.includes(:favorite_users)
    end
    def new
      @topic = Topic.new
    end
    
    def create
      @topic = current_user.topics.new(topic_params)
      
      if @topic.save
        redirect_to topics_path, success: '投稿に成功しました'
      else
        flash.now[:denger] = "投稿に失敗しました"
        render :new
      end
    end 
    
    def new
      if logged_in?
        @topic = Topic.new
      else
        redirect_to login_path, info:'ログインしてください'
      end 
    end  
    
    def destroy
      Favorite.find_by(params[:topic_id]).destroy
      flash[:success] = "お気に入りを解除しました"
      redirect_to topics_path
    end 
    
    private
    def topic_params
      params.require(:topic).permit(:image, :description)
    end
end  