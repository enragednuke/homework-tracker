module ApplicationHelper
	def sortable(column, title = nil)
  		title ||= column.titleize
  		css_class = column == sort_column ? "current #{sort_direction}" : nil
  		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  		link_to title, {:sort => column, :direction => direction, :view_asn => true}, {:class => css_class}
	end

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do 
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message 
            end)
    end
    nil
  end

  def flash_add(flash_type, message)
    if flash[flash_type.to_sym].present?
      flash[flash_type.to_sym].append(message)
    else
      flash[flash_type.to_sym] = [message]
    end
  end
end
