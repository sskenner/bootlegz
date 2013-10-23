require 'spec_helper'

describe QueueItemsController do
  describe "GET index" do
    it "sets @queue_items to the queue items of the logged in user" do
      sam = Fabricate(:user)
      session[:user_id] = sam.id
      queue_item1 = Fabricate(:queue_item, user: sam)
      queue_item2 = Fabricate(:queue_item, user: sam)
      get :index
      expect(assigns(:queue_items)).to match_array([queue_item1, queue_item2])
    end

    it "redirects to the sign in page for unauthenticated users" do
      get :index
      expect(response).to redirect_to sign_in_path
    end
  end

  describe "POST create" do
    it "redirects to the my queue page" do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      post :create, video_id: video.id
      expect(response).to redirect_to my_queue_path
    end

    it "creates a queue item" do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      post :create, video_id: video.id
      expect(QueueItem.count).to eq(1)
    end

    it "creates the queue item that is associated with the video"
    it "creates the queue item that is assoiated with the sign in user"
    it "puts the video as the last one in the queue"
    it "does not add the video to the que if the video is already in the que"
    it "redirects to the sign in page for unauthenticated users"
  end
end




