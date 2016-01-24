json.array!(@churches) do |church|
  json.extract! church, :id, :name, :denomination, :church_image
  json.url church_url(church, format: :json)
end
