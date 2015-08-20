json.array!(@projects) do |project|
  json.extract! project, :id, :project_name, :start_date, :end_date, :project_desc
  json.url project_url(project, format: :json)
end
