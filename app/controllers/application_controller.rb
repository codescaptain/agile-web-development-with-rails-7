class ApplicationController < ActionController::Base
  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found(exception)
    flash[:error] = exception.message
    redirect_to request.referer || store_index_path
  end
end
