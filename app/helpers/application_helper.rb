module ApplicationHelper

  def flash_message_types
    ['success', 'error', 'alert', 'notice']
  end

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

end
