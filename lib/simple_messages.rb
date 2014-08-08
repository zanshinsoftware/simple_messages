require "i18n"
require "action_controller"
require "action_view"
require "active_support"
require "simple_messages/engine"
require "simple_messages/version"

module SimpleMessages

  autoload :ActionController, 'simple_messages/action_controller'

  autoload :ActionView, 'simple_messages/action_view'

  autoload :Builder, 'simple_messages/builder'

end

# Include ActionController functionality
ActionController::Base.send :include, SimpleMessages::ActionController

# Include ActionView functionality
ActionView::Base.send :include, SimpleMessages::ActionView
