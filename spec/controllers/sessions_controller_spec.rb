require 'spec_helper'

describe SessionsController do
  describe "GET new" do
    it "renders the new template for unauthenticated users" do
      get :new
      expect(response).to render_template :new
    end

    it "redirects to the home page for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to home_path
    end
  end

  describe "POST create" do
    context "with valid credentials" do
      before do
        sam = Fabricate(:user)
        post :create, email: sam.email, password: sam.password
      end

      it "puts the signed in user in the session" do
        sam = Fabricate(:user)
        post :create, email: sam.email, password: sam.password
        # why do i get rspec error when i move these to before do above?
        expect(session[:user_id]).to eq(sam.id)
      end

      it "redirects to the home page" do
        expect(response).to redirect_to home_path
      end

      it "sets the notice" do
        expect(flash[:notice]).not_to be_blank
      end
    end

    context "with invalid credentials" do
      before do
        sam = Fabricate(:user)
        post :create, email: sam.email, password: sam.password + 'asdfasdf'
      end

      it "does not put the signed in user in the session" do
        expect(session[:user_id]).to be_nil
      end

      it "redirect_to the sign page" do
        expect(response).to redirect_to sign_in_path
      end

      it "sets the error" do
        expect(flash[:error]).not_to be_blank
      end
    end
  end

  describe "Get destroy" do
    before do
      session[:user_id] = Fabricate(:user).id
      get :destroy
    end

    it "clears the session for the user" do
      expect(session[:user_id]).to be_nil
    end

    it "redirects to the root path" do
      expect(response).to redirect_to root_path
    end

    it "sets the notice" do
      expect(flash[:notice]).not_to be_blank
    end
  end
end
