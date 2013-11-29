class Admin::VideosController < AdminsController
  before_filter :require_user
  before_filter :require_admin #why doesnt it inherit from AdminsController

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(params[:video])
    if @video.save
      flash[:success] = "you have successfully added the video '#{@video.title}'"
      redirect_to new_admin_video_path
    else
      flash[:error] = "the video was not added .. please check the errors"
      render :new
    end
  end
end
