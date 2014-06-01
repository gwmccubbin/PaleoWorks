module ApplicationHelper

  def bootstrap_class_for(flash_type)
    case flash_type
      when :success
        "alert-success"   # Green
      when :error
        "alert-danger"    # Red
      when :alert
        "alert-warning"   # Yellow
      when :notice
        "alert-info"      # Blue
      else
        flash_type.to_s
    end
  end

  def default_panel(title, &block)
    content_tag :div, class: 'panel panel-default' do
      content = content_tag :div, class: 'panel-heading' do
        content_tag :h3, title
      end

      content += content_tag(:div, class: 'panel-body') do
        capture(&block)
      end

      content
    end
  end

  def delivery_type(custom_delivery)
    if custom_delivery == true
      "Custom Delivery"
    else
      "Gym Delivery"
    end
  end

  def human_boolean(boolean)
    boolean ? 'Yes' : 'No'
  end

  def icon_input(form_object, field, klass, placeholder, options = {})
    options = options.merge(placeholder: placeholder, addon_html: { class: klass })
    form_object.input field, options
  end

  def cutlery_icon_input(form_object, field, placeholder, options = {})
    icon_input form_object, field, 'glyphicon glyphicon-cutlery', placeholder, options
  end

  def email_icon_input(form_object, field, placeholder, options = {})
    icon_input form_object, field, 'icon-email', placeholder, options
  end

  def home_icon_input(form_object, field, placeholder, options = {})
    icon_input form_object, field, 'glyphicon glyphicon-home', placeholder, options
  end

  def phone_icon_input(form_object, field, placeholder, options = {})
    icon_input form_object, field, 'glyphicon glyphicon-phone-alt', placeholder, options
  end
end
