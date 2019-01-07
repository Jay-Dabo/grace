class SubscriptionsController < ApplicationController
  before_action :set_church, except: [:create]
  before_action :set_subscription, only: [:show, :edit, :destroy]
  skip_before_action :ensure_subscription, except: [:index, :show]
  layout 'plain', only: [:new, :create]
  layout 'admin', only: [:show, :edit]

  def index
  end

  def show
  end

  def new
  end

  def create
    response = Subscriptions::CreateSubscription.call(user: current_user,
                                                      church: current_church,
                                                      token: params[:stripeToken])

    if response.success?
      flash[:notice] = response[:success_message]
      redirect_to church_path(current_church.id)
    else
      flash[:notice] = response[:error_message]
      redirect_to root_path
    end
  end

  def destroy
    @subscription.destroy
    flash[:alert] = "Your Subscription has been cancelled."
    redirect_to root_path
  end

  private

  def set_church
    @church = Church.find(params[:church_id])
  end

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end
end