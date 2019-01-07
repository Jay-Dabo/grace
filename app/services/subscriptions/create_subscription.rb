require 'service_return_structs'
require 'stripe'

class Subscriptions::CreateSubscription
  def self.call(user:, church:, token:)
    stripe_customer = Stripe::Customer.create({
      email: user.email,
      source: token,
    })

    stripe_subscription = Stripe::Subscription.create({
      customer: stripe_customer.id,
      items: [{ plan: 'plan_DcNItmWIOlWImY' }],
      # trial_period_days: 30
    })

    subscription = Subscription.new(church_id: church.id,
                                    subscription_id: stripe_subscription.id,
                                    customer_id: stripe_customer.id,
                                    plan_id: stripe_subscription.plan.id,
                                    charge_amount: stripe_subscription.plan.amount)

    if subscription.save
      return Success.new('Successfully created a subscription.')
    else
      return Error.new("Subscription can't be created at this time.")
    end
  end
end