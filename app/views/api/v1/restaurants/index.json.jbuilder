# app/views/api/v1/restaurants/index.json.jbuilder

json.array! @restaurants do |restaurant|
  json.id restaurant.id
  json.name restaurant.name
  json.description restaurant.description
  json.rating restaurant.rating
  json.created_at restaurant.created_at
  json.updated_at restaurant.updated_at
end
