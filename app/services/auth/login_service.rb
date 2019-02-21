class Auth::LoginService

  attr_reader :create_params

  def initialize(create_params)
    @create_params = create_params
  end

  def process
    return 'ok' if create_params[:email].present? && find_user.present? && valid_params?
    'nok'
  end

  private

  def valid_params?
    find_user.authenticate(create_params[:password])
  end

  def find_user
    @find_user ||= User.find_by(email: create_params[:email])
  end

end