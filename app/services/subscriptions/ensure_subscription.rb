require 'service_return_structs'
require 'stripe'

class Subscriptions::EnsureSubscription
  def self.call(church:)
    unless church.subscription.present?
      return Error.new("Looks like you don't have a subscription! Please create a subscription to continue.")
    end
  end
end