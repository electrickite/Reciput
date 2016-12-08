module Sortable
  extend ActiveSupport::Concern

  # PUT /recipes/1/steps/sort
  # PUT /recipes/1/steps/sort.json
  def sort
    params[:order].each do |key, value|
      model = controller_path.classify.constantize.find(value[:id])
      authorize model
      model.update(sequence: value[:sequence].to_i)
    end

    render nothing: true, status: 204
  end

end
