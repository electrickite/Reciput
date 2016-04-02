module ApplicationHelper

  def alert_class_for flash_type
    case flash_type
      when 'success'
        "alert-success"
      when 'error'
        "alert-danger"
      when 'alert'
        "alert-warning"
      when 'notice'
        "alert-info"
      else
        flash_type.to_s
    end
  end

  def nav_link_to(text, path)
    options = current_page?(path) ? { class: "active" } : {}
    content_tag(:li, options) do
      link_to text, path
    end
  end

end
