class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
