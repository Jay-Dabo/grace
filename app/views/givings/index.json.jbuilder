json.array!(@givings) do |giving|
  json.extract! giving, :id
  json.url giving_url(giving, format: :json)
end
