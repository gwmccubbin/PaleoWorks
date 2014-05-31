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
end
