class InvitationsController < ApplicationController
  before_filter :require_user

  def new
    @invitation = Invitation.new
  end

  def create
    invitation = Invitation.create(params[:invitation].merge!(inviter_id: current_user.id))
    AppMailer.send_invitation_email(invitation).deliver
    redirect_to new_invitation_path
  end
end
