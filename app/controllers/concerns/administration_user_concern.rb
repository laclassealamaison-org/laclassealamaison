module AdministrationUserConcern
  extend ActiveSupport::Concern
  included do
    before_action :authenticate_user!

    layout 'administration'

    def index
      @users = policy_scope([:administration, user_role]).order(created_at: :desc)
      authorize [:administration, user_role]
    end

    def edit
      @user = policy_scope([:administration, user_role]).find(params[:id])
      authorize [:administration, user_role]
    end

    def update
      @user = policy_scope([:administration, user_role]).find(params[:id])
      authorize [:administration, user_role]

      @user.update!(user_params)

      redirect_to url_for([:administration, user_role.to_s.pluralize.to_sym])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
  end
end
