class SubscriptionsController < ApplicationController
  skip_before_action :ensure_subscription
  require 'stripe'
  layout 'plain'

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
      flash[:error] = "Subscription can't be created at this time."
      redirect_to root_path
    end
  end

  def destroy
    stripe_subscription = Stripe::Subscription.retrieve(current_user.church.subscription.subscription_id)
    stripe_subscription.delete

    subscription = Subscription.where(church_id: current_user.church.id)
    subscription.destroy
    flash[:error] = "Your Subscription has been cancelled."
    redirect_to root_path
  end
end