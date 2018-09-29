class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_raven_context, :set_flash_from_params, :set_persistent_flash_from_session

  private

  def set_persistent_flash_from_session
    flash.now[:persistent] = session[:persistent_flash] if session[:persistent_flash]
  end

  def set_raven_context
    # Raven.user_context(id: session[:current_user_id])
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end

  def set_flash_from_params
    return unless params[:flash_notice]

    msg = params[:flash_notice]
    params[:flash_type] ? flash[params[:flash_type].to_sym] = msg : flash[:notice] = msg
  end

  def build_ransack_search klass
    search = klass.ransack(params[:q])
    search.build_condition if search.conditions.empty?
    search.build_sort if search.sorts.empty?
    search
  end
end
