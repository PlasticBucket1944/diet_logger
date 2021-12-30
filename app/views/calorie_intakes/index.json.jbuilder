json.array! @calories do |calorie|
    json.id calorie.id
    json.name calorie.name
    json.date calorie.date
    json.amount calorie.amount
  end