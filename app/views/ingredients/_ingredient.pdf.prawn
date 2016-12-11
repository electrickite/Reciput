formatted = format_amount(ingredient.amount)
formatted << " #{ingredient.unit}" if ingredient.unit.present?
formatted << " #{ingredient.food.name}"
formatted << ", #{ingredient.notes}" if ingredient.notes.present?
pdf.text formatted
