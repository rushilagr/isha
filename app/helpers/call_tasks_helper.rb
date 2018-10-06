module CallTasksHelper
  def dashboard_overview_link_with_auto_disable text, ct_id, scope_param_key, scope_param_value
    link_to text,
      call_task_path(
        ct_id,
        params.to_unsafe_h .slice(:caller_scope, :participant_scope) .merge(scope_param_key => scope_param_value),
      ),
      class: "#{'disable-link' if params[scope_param_key] == scope_param_value}"
  end
end
