module ApplicationHelper
  def link_to_add_participant_fields(name, f, type, locals = {})
    new_object = f.object.send "build_#{type}"

    id = "new_#{type}"

    fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
      render('participants/' + type.to_s + "_fields", { f: builder }.merge(locals) )
    end

    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
