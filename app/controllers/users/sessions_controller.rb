class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = User.find(1)
    user.update(username: "かがたく", email: "kagtaku7424@icloud.com") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path
  end
end