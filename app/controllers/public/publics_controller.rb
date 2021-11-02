class Public::PublicsController < ApplicationController
  before_action :authenticate_customer!

  def show
      @public = current_customer
  end

  def edit
      @public = current_customer
  end

  def update
      @public = current_customer
      if @public.update(public_params)
         flash[:success] = "Fixed"
         redirect_to action: :show
      else
          render 'edit'
      end
  end

  def unsubscribe
  end

  def withdraw
      @public = current_customer
      @public.update(is_active: true)
      reset_session

      flash[:notice] = "BYE"
      redirect_to root_path
  end

  private
      def public_params
          params.require(:public).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone_number, :is_active)
      end
end