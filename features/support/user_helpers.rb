module UserHelpers
  def user
    @user ||= User.new
  end
end
