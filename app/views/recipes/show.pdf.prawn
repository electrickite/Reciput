info = {
  Title: @recipe.name,
  Author: @recipe.owner.try(:username),
  Creator: 'Reciput',
  CreationDate: @recipe.created_at
}

options = {
  margin: 60,
  info: info,
  # force_download: true,
  # filename: "#{@recipe.name.parameterize}.pdf"
}

prawn_document(options) do |pdf|
  pdf.font "Helvetica"
  pdf.font_size 12

  pdf.text @recipe.name, size: 24, style: :bold
  pdf.move_down 8

  info_line = pdf.cursor

  pdf.text "Yield: #{@recipe.yield}", align: :left, style: :italic
  pdf.move_cursor_to info_line
  pdf.text "Active time: #{@recipe.active_time}", align: :center, style: :italic
  pdf.move_cursor_to info_line
  pdf.text "Total time: #{@recipe.total_time}", align: :right, style: :italic
  pdf.move_down 5

  pdf.stroke_horizontal_rule
  pdf.move_down 10

  if @recipe.image.present?
    image = pdf.image @recipe.image.path(:medium), at: [292, pdf.cursor], fit: [200, 200]

    excess_description = pdf.text_box @recipe.description,
      at: [0, pdf.cursor],
      width: 287,
      height: image.scaled_height + 10,
      overflow: :truncate

    pdf.move_down image.scaled_height + 9
    pdf.text excess_description if excess_description.present?
  else
    pdf.text @recipe.description
  end

  pdf.move_down 10
  if @recipe.equipment.present?
    pdf.text "<b>Equipment:</b> #{@recipe.equipment}", inline_format: true
    pdf.move_down 10
  end

  pdf.start_new_page if pdf.cursor < 50
  pdf.text "Ingredients", size: 18, style: :bold
  pdf.move_down 3

  render @recipe.ingredients, pdf: pdf
  pdf.move_down 10

  pdf.start_new_page if pdf.cursor < 50
  pdf.text "Directions", size: 18, style: :bold
  pdf.move_down 3

  render @recipe.steps, pdf: pdf
end
