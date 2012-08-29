#encoding: utf-8
module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
  
  
  def humanize_date_range date_start, date_end
    # all_to_show = [:Y, :m, :d, :H, :M]
    date_to_show = [:Y, :m, :d]
    time_to_show = [:H, :M]
    
    date_to_show.delete(:Y) if date_start.year == date_end.year
    date_to_show.delete(:m) if date_start.month == date_end.month
    date_to_show.delete(:d) if date_start.day == date_end.day
    time_to_show.delete(:H) if date_start.hour == date_end.hour
    time_to_show.delete(:M) if date_start.min == date_end.min
    if time_to_show.empty? and date_to_show.empty?
      return "#{date_start.strftime('%d.%m.%Y')} в #{date_start.strftime('%H:%M')}"
    elsif time_to_show.size == 2 and date_to_show.empty?
      return "С #{date_start.strftime('%H:%M')} до #{date_end.strftime('%H:%M')} #{date_end.strftime('%d.%m.%Y')}"
    elsif date_to_show.size == 1 and time_to_show.empty? and date_to_show.index(:d)
      return "С #{date_start.strftime('%d')} по #{date_end.strftime('%d')} #{date_start.strftime('%b %Yг')}"
    elsif time_to_show.empty? 
      return "C #{date_start.strftime('%d.%m.%Y')} по #{date_end.strftime('%d.%m.%Y')}"
    else
      return "C #{date_start.strftime('%d.%m.%Y %H:%M')} по #{date_end.strftime('%d.%m.%Y %H:%M')}"
    end
  end
end

