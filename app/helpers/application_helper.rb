module ApplicationHelper

  def status_helper(status)
    case status
    when 200..399 then content_tag :span, 'OK', :class => 'badge badge-success'
    when 200..399 then content_tag :span, status, :class => 'badge badge-important'
    end
  end

  def response_time_helper(time)
    case time
    when 0..1 then content_tag :span, (time * 1000).to_i, :class => 'badge badge-success'
    when 1..3 then content_tag :span, (time* 1000).to_i, :class => 'badge badge-warning'
    when 3.01..5 then content_tag :span, (time* 1000).to_i, :class => 'badge badge-important'
    end
  end

end
