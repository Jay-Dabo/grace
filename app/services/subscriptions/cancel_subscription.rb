require 'service_return_structs'
require 'stripe'

class Subscriptions::CancelSubscription
  def self.call(subscription_id:)
    stripe_subscription = Stripe::Subscription.retrieve(subscription_id)
    stripe_subscription.delete
  end
end