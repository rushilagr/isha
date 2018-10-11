module RansackHelpers
  extend ActiveSupport::Concern

  def build_ransack_search klass
    search = klass.ransack(params[:q])
    search.build_condition if search.conditions.empty?
    search.build_sort if search.sorts.empty?
    search
  end

  def get_participant_search_obj
    params[:search_type] = 'simple' if params[:search_type].blank?
    search_type = params[:search_type]

    if search_type == 'simple'
      Participant.ransack(params[:q])
    elsif search_type == 'advanced'
      build_ransack_search Participant
    end
  end
end
