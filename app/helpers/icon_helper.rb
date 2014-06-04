module IconHelper
  def icon_true
    content_tag(:span, nil,  class: 'green glyphicon glyphicon-ok')
  end

  def icon_false
    content_tag(:span, nil,  class: 'red glyphicon glyphicon-remove')
  end

  def icon_true?(condition)
    condition ? icon_true : nil
  end

  def icon_boolean(condition)
    condition ? icon_true : icon_false
  end
end
