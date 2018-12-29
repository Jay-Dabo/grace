class SubscriptionsController < ApplicationController
  before_action :set_church, except: [:create]
  before_action :set_subscription, only: [:show, :edit, :destroy]
  skip_before_action :ensure_subscription, except: [:index, :show]
  require 'stripe'
  layout 'plain', only: [:new, :create]
  layout 'admin', only: [:show, :edit]

  def index
  end

  def show
  end

  def new
  end

  def create
    stripe_customer = Stripe::Customer.create({
      email: current_user.email,
      source: params[:stripeToken],
    })

    stripe_subscription = Stripe::Subscription.create({
      customer: stripe_customer.id,
      items: [{ plan: 'plan_DcNItmWIOlWImY' }]
    })

    subscription = Subscription.new(church_id: current_user.church_id,
                                    subscription_id: stripe_subscription.id,
                                    customer_id: stripe_customer.id)

    if subscription.save
      flash[:notice] = "Successfully created a subscription."
      redirect_to church_path(current_user.church_id)
    else
      flash[:notice] = "Subscription can't be created at this time."
      redirect_to root_path
    end
  end

  def destroy
    stripe_subscription = Stripe::Subscription.retrieve(current_church.subscription.subscription_id)
    stripe_subscription.delete

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