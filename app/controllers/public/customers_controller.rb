class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @parks = @customer.parks
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
       flash[:success] = "登録情報を変更しました"
       redirect_to customer_path(current_customer)
    else
       render :edit
    end
  end
  
  def unsubscribe
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用をお待ちしております"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:email,:nickname,:introduction,:profile_image)
  end
end