def set_current_user(user=nil)
  session[:user_id] = (user || Fabricate(:user)).id
end

def set_current_admin(admin=nil)
  session[:user_id] = (admin || Fabricate(:admin)).id
end

def sign_in(a_user=nil)
    user = a_user || Fabricate(:user)
    visit sign_in_path
    fill_in "email address", with: user.email
    fill_in "password", with: user.password
    click_button "sign in"
end

def sign_out
  visit sign_out_path
end

def click_on_video_on_home_page(video)
  find("a[href='/videos/#{video.id}']").click
end
