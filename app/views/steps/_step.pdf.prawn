pdf.start_new_page if pdf.cursor < 10
pdf.text_box "#{step_counter + 1}.", at: [13, pdf.cursor]
pdf.indent(35) do
  pdf.text step.directions
  pdf.move_down 8
end
