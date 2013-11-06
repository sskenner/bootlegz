class InvitationsController < ApplicationController
  before_filter :require_user

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(params[:invitation].merge!(inviter_id: current_user.id))
    if @invitation.save
      AppMailer.send_invitation_email(@invitation).deliver
      flash[:success] = "you have successfully put #{@invitation.recipient_name} down wit da ish."
      redirect_to new_invitation_path
    else
      flash[:error] = "please check yo-self .. and yo-inputs"
      render :new
    end
  end
end
