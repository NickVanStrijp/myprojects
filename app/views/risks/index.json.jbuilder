json.array!(@risks) do |risk|
  json.extract! risk, :id, :risk_source, :risk_probability, :risk_impact, :risk_status, :risk_plan
  json.url risk_url(risk, format: :json)
end
