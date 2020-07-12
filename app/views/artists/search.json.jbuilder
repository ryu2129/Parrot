json.array! @artists do |artist|
  json.id artist.id
  json.name artist.name
  json.image artist.image
end