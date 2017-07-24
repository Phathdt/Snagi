class SetActiveUserService
  def initialize(params)
    @id = params[:id]
  end

  def set_active
    User.find(@id).toggle(:is_active).save
  end
end
