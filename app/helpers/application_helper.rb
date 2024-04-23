# app/helpers/application_helper.rb
module ApplicationHelper
  def sort_link(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, { order: column, direction: direction }
  end

  def sort_column
    Player.column_names.include?(params[:order]) ? params[:order] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
