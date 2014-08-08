module SimpleMessages
  module ActionView
    extend ActiveSupport::Concern

    def simple_messages(options = {})
      options.reverse_merge! flash_messages: true, validation_messages: true

      html = ''.html_safe

      html << simple_messages_flash(options) if options.delete(:flash_messages)

      html << simple_messages_validation(options) if options.delete(:validation_messages)

      html
    end

    def simple_messages_flash(options = {})
      flash.collect do |kind, content|
        builder = Builder.new({ kind: kind, body: content }.reverse_merge(options))

        builder.to_html
      end.join.html_safe
    end

    def simple_messages_objects
      simple_messages_models.collect do |model_name|
        object = instance_variable_get("@#{model_name}")

        object if object.present? and object.errors.any?
      end.compact
    end

    def simple_messages_validation(options = {})
      simple_messages_objects.collect do |object|
        title = I18n.t('errors.template.header', count: object.errors.count, model: object.class.model_name.human)

        builder = Builder.new({ kind: :error, body: object.errors.full_messages, header: title }.reverse_merge(options))

        builder.to_html
      end.join.html_safe
    end

    def js_simple_messages
      "SimpleMessages.flash('#{j simple_messages}');".html_safe
    end

    def js_simple_messages_alert(messages = [])
      "SimpleMessages.alert(#{messages.to_json});".html_safe
    end

  end
end

