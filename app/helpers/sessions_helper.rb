module SessionsHelper
  def alert_error
    tag = content_tag :ul do
      content_tag(:li, alert, class: 'errors')
    end
    tag if alert
  end
end
