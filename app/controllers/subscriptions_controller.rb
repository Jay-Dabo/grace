class SubscriptionsController < ApplicationController
  require 'stripe'
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
    stripe_customer = Stripe::Customer.create({
      email: current_user.email,
      source: params[:stripeToken],
    })

    stripe_subscription = Stripe::Subscription.create({
      customer: stripe_customer.id,
      items: [{ plan: 'plan_DcNItmWIOlWImY' }],
      #trial_period_days: 30
    })

    subscription = Subscription.new(church_id: current_user.church_id,
                                    subscription_id: stripe_subscription.id,
                                    customer_id: stripe_customer.id,
                                    plan_id: stripe_subscription.plan.id,
                                    charge_amount: stripe_subscription.plan.amount)

    if subscription.save
      flash[:notice] = "Successfully created a subscription."
      redirect_to church_path(current_user.church_id)
    else
      flash[:notice] = "Subscription can't be created at this time."
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