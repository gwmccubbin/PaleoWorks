module ApplicationHelper

  def full_title(page_title)
    if page_title.empty?
      "PaleoWorks"
    else
      "PW :: #{page_title}"
    end
  end

  def bootstrap_class_for(flash_type)
    case flash_type
      when 'success'
        "alert-success"   # Green
      when 'error'
        "alert-danger"    # Red
      when 'alert'
        "alert-warning"   # Yellow
      when 'notice'
        "alert-info"      # Blue
      else
        flash_type.to_s
    end
  end

  def current_class?(path)
    request.path == path ? 'active' : ''
  end

  def sidebar_link_group(links_hash)
    content_tag :ul, class: 'nav nav-sidebar' do
      links_hash.each do |link_name, path|
        concat content_tag(:li, link_to(link_name, path), class: current_class?(path) )
      end
    end
  end

  def human_boolean(boolean)
    boolean ? 'Yes' : 'No'
  end

  def object_name(object)
    object.class.to_s.downcase
  end

  def object_controller(object)
    object_name(object).pluralize
  end

  def page_for(object, action, &block)
    content_tag :div, class: "#{action} #{object_name(object)}-#{action}" do
      capture(&block)
    end
  end

  def page_heading(heading, icon_name, options = {})
    content = content_tag :div, class: 'page-heading' do
      c = content_tag(:span, nil,  class: "glyphicon glyphicon-#{icon_name}") + content_tag(:h2, heading)
      
      c += link_to_if(options[:action] == 'show', 
                      content_tag(:span, nil, class: 'glyphicon glyphicon-pencil'), 
                      link_options(object_controller(options[:object]), 'edit', id: options[:object])
                      ) { }
    end

    content += content_tag :hr
  end

  def page_content(options ={}, &block)
    if options[:action] == 'index'
      content_tag :div, class: 'index-body' do
        capture(&block)
      end

    else

      content_tag :div, class: 'row' do
        content_tag :div, class: 'col-md-9 col-md-offset-1' do
          capture(&block)
        end
      end
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

  def link_options(controller, action, object)
    { controller: controller, action: action, id: object[:id] }
  end

  def delete_link_options(object, action)
    delete_args = { method: 'delete', data: { confirm: "Are you sure you want to delete #{object_name(object)}?" } }

    action == 'destroy' ? delete_args :  { }
  end

  def table_actions(object)
    content_tag :ul do
       
      [{ action: 'show', icon: 'eye-open'}, 
       { action: 'edit', icon: 'pencil'},
       { action: 'destroy', icon: 'remove'}].each do |link|

        concat content_tag(:li, link_to(content_tag(:span, nil, class: "glyphicon glyphicon-#{link[:icon]}"), 
                                        link_options(object_controller(object), link[:action], object),
                                        delete_link_options(object, link[:action])))
      end
    end
  end

  def bottom_buttons(button_names_hash)
    content_tag :div, class: 'bottom-actions pull-right' do 
      content = content_tag :ul do      
        button_names_hash.collect do |btn_name, path| 
          concat(content_tag(:li, link_to(btn_name, path, class: 'btn btn-primary'))) 
        end
      end
    end    
  end
end
