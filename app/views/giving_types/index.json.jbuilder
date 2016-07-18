json.array!(@giving_types) do |giving_type|
  json.extract! giving_type, :id, :type, :church_id
  json.url giving_type_url(giving_type, format: :json)
end
