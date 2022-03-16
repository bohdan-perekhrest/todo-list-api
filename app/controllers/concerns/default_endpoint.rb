# frozen_string_literal: true

module DefaultEndpoint
  def default_cases # rubocop:disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
    {
      created:      ->(result) { result.success? && result[:semantic_success] == :created },
      destroyed:    ->(result) { result.success? && (result[:model].try(:destroyed?) || result[:semantic_success] == :destroyed) },
      unauthorized: ->(result) { result.failure? && (result[:current_user].nil? || result['policy.default'] == false) },
      not_found:    ->(result) { result.failure? && result['result.model']&.failure? },
      forbidden:    ->(result) { result.failure? && (result['result.policy.default']&.failure? || result[:semantic_failure] == :forbidden) },
      accepted:     ->(result) { result.success? && result[:semantic_success] == :accepted },
      invalid:      ->(result) { result.failure? && result['contract.form']&.errors.present? && result[:semantic_failure] == :invalid },
      success:      ->(result) { result.success? && result[:semantic_success] == :success },
      bad_request:  ->(result) { result.failure? && result[:semantic_failure] == :bad_request },
    }
  end

  def default_handler
    {
      created:      ->(result) { render_head_or_response(result, :created) },
      destroyed:    ->(_result) { head(:no_content) },
      unauthorized: ->(result) { head(:unauthorized) },
      not_found:    ->(result) { render_head_or_errors(result, :not_found) },
      forbidden:    ->(result) { render_head_or_errors(result, :forbidden) },
      invalid:      ->(result) { render_errors(result, :bad_request) },
      accepted:     ->(_result) { head(:accepted) },
      success:      ->(result) { success_response(result) },
      bad_request:  ->(result) { render_errors(result, :bad_request) },
    }
  end

  private

  def render_response(result, status)
    response.set_header('access-token', result[:token]) if result[:token]
    render(json: Service::JsonApi::ResourceSerializer.call(result), status: status)
  end

  def render_errors(result, status)
    response.set_header('access-token', result[:token]) if result[:token]
    render(json: Service::JsonApi::ResourceErrorSerializer.call(result), status: status)
  end

  def render_head_or_response(result, status)
    renderer = result[:render]
    renderer ? render_response(result, status) : head(status)
  end

  def success_response(result)
    status = result[:render] ? :ok : :no_content
    render_head_or_response(result, status)
  end

  def render_head_or_errors(result, status)
    errors = result['contract.default']
    errors ? render_errors(result, status) : head(status)
  end
end
