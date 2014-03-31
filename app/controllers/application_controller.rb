class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActionController::RoutingError, :with => :render_404

  private

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def render_404(exception = nil)
    if exception
      # do something
    end

    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

end
