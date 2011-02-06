module ApplicationHelper
  
  def show_flash
    flashes = [:error, :notice, :warning, :message].collect do |key|
      content_tag(:div, flash[key], :class => "flash flash_#{key}") unless flash[key].blank?
    end.join
    "<div id=\"flash\">#{flashes}</div>".html_safe
  end

  def current_person
    @current_person ||= session[:person_id]
  end

end
