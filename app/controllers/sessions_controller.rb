class SessionsController < Devise::SessionsController
  skip_before_action :ensure_subscription
  layout 'plain'
end