module ApplicationHelper
  def link_to_add_fields(f, association, &blk)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to('#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")}) do
      capture(&blk)
    end
  end
end
