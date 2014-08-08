module SimpleMessages
  module ActionController
    extend ActiveSupport::Concern

    included do
      helper_method :simple_messages_for_model, :dont_simple_messages_for_model, :simple_messages_models

      before_action :simple_messages_initialize, :simple_messages_for_current_controller
    end

    def simple_messages_for_model(*model_name)
      @simple_messages_models.concat model_name
    end

    def dont_simple_messages_for_model(*model_name)
      @dont_simple_messages_models.concat model_name
    end

    def simple_messages_models
      (@simple_messages_models.collect(&:to_sym) - @dont_simple_messages_models.collect(&:to_sym)).compact.uniq
    end

    private

    def simple_messages_initialize
      @dont_simple_messages_models ||= []
      @simple_messages_models ||= []
    end

    def simple_messages_for_current_controller
      @simple_messages_models << controller_name.singularize.to_sym
    end
  end
end
