module CustomersHelper
  def display_standard_order
    result = ""
    [:breakfast, :lunch, :dinner, :special].each do |type|
      method = "#{type}_qty".to_sym
      unless @standard_order.send(method).nil?
        result += "<dt>#{type.to_s.capitalize.pluralize}:</dt>"
        result += "<dd>#{@standard_order.send(method)}</dd>"
      end
    end

    result.html_safe
  end
end
