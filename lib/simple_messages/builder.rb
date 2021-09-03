module SimpleMessages
  class Builder
    ALERT_CLASS_MAPPING = { alert: 'warning', notice: 'success', error: 'danger' }

    attr_accessor :header, :body, :kind, :closable, :html

    def initialize(params = {})
      params.each do |attr, value|
        instance_variable_set "@#{attr}", value
      end

      set_defaults
    end

    def closable?
      closable
    end

    def has_header?
      header.present?
    end

    def to_html
      wrapper = "<div #{alert_attributes}>"
      wrapper << close_wrapper  if closable?
      wrapper << header_wrapper if has_header?
      wrapper << body_to_s
      wrapper << "</div>"
      wrapper
    end

    def close_wrapper
      "<button type='button' class='btn-close' data-bs-dismiss='alert'></button>"
    end

    def header_wrapper
      return unless has_header?

      "<strong>#{header}</strong><br>"
    end

    private
    def set_defaults
      kind_default
      closable_default
    end

    def kind_default
      @kind = 'success' if @kind.nil?
    end

    def closable_default
      @closable = true if @closable.nil?
    end

    def adjust_html
      @html ||= {}
      @html = { class: '', role: 'alert' }.merge(@html)
      @html[:class] << ' alert '
      @html[:class] << alert_kind_class
      @html[:class] << ' alert-dismissible' if closable?
      @html[:class].strip!
    end

    def alert_attributes
      adjust_html

      html_to_attributes
    end

    def alert_kind_class
      "alert-#{ALERT_CLASS_MAPPING.fetch(kind.to_sym, kind)}"
    end

    def body_to_s
      return @body unless @body.is_a? Array

      @body.join '<br />'
    end

    def html_to_attributes
      @html.collect { |a, v| "#{a}='#{v}'" }.join(' ')
    end
  end
end
