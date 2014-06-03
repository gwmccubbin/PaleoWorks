module FormHelper
  def bottom_form_buttons(form_object, buttons_hash)
    content_tag :div, class: 'bottom-actions pull-right' do 
      content = content_tag :ul do
        buttons_hash.collect do |btn_name, klasses| 
          concat(content_tag(:li, form_object.submit(btn_name, class: "btn #{klasses}"))) 
        end
      end
    end
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

  def dollar_icon_input(form_object, field, placeholder, options = {})
    icon_input form_object, field, 'icon-dollar', placeholder, options
  end
end