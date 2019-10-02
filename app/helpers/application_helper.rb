module ApplicationHelper
  def authenticated?
    !session[:current_user_id].nil?
  end

  @current_user = nil

  def principal
    return nil unless authenticated?

    @current_user ||= User.find(session[:current_user_id])
    @current_user
  end

  def full_title(title)
    base = 'Private Events'
    title.nil? ? base : "#{base} - #{title}"
  end
end
