require 'devise'

Devise.setup do |config|
  # It should be a symbol containing the name
  # of the mountable engine's named-route set.
  config.router_name = :active_portal

  # You probably want Devise's controllers to inherit from your engine's 
  # controller and not the main controller.
  config.parent_controller = 'ActivePortal::ApplicationController'
end
