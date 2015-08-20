json.array!(@references) do |reference|
  json.extract! reference, :id, :ref_title, :ref_desc, :ref_link, :ref_type
  json.url reference_url(reference, format: :json)
end
