module UserHelper
  def is_accessible?
    current_user.id == params[:id]
  end
end
