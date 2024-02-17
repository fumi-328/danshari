class Users::SessionsController < Devise::SessionsController
  def destroy
    super do
      flash.clear
      flash[:success] = t('defaults.flash_message.logout')
      redirect_to root_path and return
    end
  end
end
