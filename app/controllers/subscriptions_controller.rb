class SubscriptionsController < ApplicationController
  require 'stripe'

  def new
  end

  def create
    customer = Stripe::Customer.create({
      email: current_user.email,
      source: params[:stripeToken],
    })

    subscription = Stripe::Subscription.create({
      customer: customer.id,
      items: [{plan: 'plan_DcNItmWIOlWImY'}]
    })

    flash[:notice] = "Successfully created a subscription."
    redirect_to church_path(current_user.church_id)
  end
end