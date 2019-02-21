class Auth::SignupService
  
  attr_reader :create_params

  def initialize(create_params)
    @create_params = create_params
  end

  def process
    # valid_params? && create_user.save ? 'ok' : 'nok'
    return 'ok' if valid_params? && create_user.save
    'nok'
  end

  private

  def valid_params?
    create_params[:email] == create_params[:email_confirm] && create_params[:password] == create_params[:password_confirm]
  end

  def create_user
    User.new(
      name: create_params[:name],
      surname: create_params[:surname],
      email: create_params[:email],
      password: create_params[:password]
    )
  end

end