module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(sort: column, direction: direction, page: nil), { class: css_class }
  end

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danager", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade-out") do
        concat content_tag(:button, 'X', class: "close", data: { dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end

  def us_states
    {
     :Alabama =>"Alabama",
     :Alaska => "Alaska",
     :Arkansas =>"Arkansas",
     :Arizona =>"Arizona",
     :California =>"California",
     :Colorado =>"Colorado",
     :Connecticut =>"Connecticut",
     "District of Columbia".to_sym =>"District of Columbia",
     :Delaware =>"Delaware",
     :Florida =>"Florida",
     :Georgia =>"Georgia",
     :Hawaii =>"Hawaii",
     :Iowa =>"Iowa",
     :Idaho =>"Idaho",
     :Illinois =>"Illinois",
     :Indiana =>"Indiana",
     :Kansas =>"Kansas",
     :Kentucky =>"Kentucky",
     :Louisiana =>"Louisiana",
     :Massachusetts =>"Massachusetts",
     :Maryland =>"Maryland",
     :Maine =>"Maine",
     :Michigan =>"Michigan",
     :Minnesota =>"Minnesota",
     :Missouri =>"Missouri",
     :Mississippi =>"Mississippi",
     :Montana =>"Montana",
     "North Carolina".to_sym =>"North Carolina",
     "North Dakota".to_sym =>"North Dakota",
     :Nebraska =>"Nebraska",
     "New Hampshire".to_sym =>"New Hampshire",
     "New Jersey".to_sym =>"New Jersey",
     "New Mexico".to_sym =>"New Mexico",
     :Nevada =>"Nevada",
     "New York".to_sym =>"New York",
     :Ohio =>"Ohio",
     :Oklahoma =>"Oklahoma",
     :Oregon =>"Oregon",
     :Pennsylvania =>"Pennsylvania",
     "Rhode Island".to_sym =>"Rhode Island",
     "South Carolina".to_sym =>"South Carolina",
     "South Dakota".to_sym =>"South Dakota",
     :Tennessee =>"Tennessee",
     :Texas =>"Texas",
     :Utah =>"Utah",
     :Virginia =>"Virginia",
     :Vermont =>"Vermont",
     :Washington =>"Washington",
     :Wisconsin =>"Wisconsin",
     "West Virginia".to_sym =>"West Virginia",
     :Wyoming =>"Wyoming"
   }
  end

  def short_date(date)
    date.strftime("%m/%d/%Y")
  end

end
