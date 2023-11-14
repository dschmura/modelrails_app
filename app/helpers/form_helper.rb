module FormHelper
  def tailwind_classes_for(flash_type)
    {
      notice: "bg-green-800 border-l-4 border-green-700 text-white opacity-90 group-hover:opacity-100 ",
      error: "bg-red-800 border-l-4 border-red-900 text-white opacity-90 group-hover:opacity-100",
      alert: "bg-red-800 border-l-4 border-red-900 text-white opacity-90 group-hover:opacity-100"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def invalid_field?(resource, field)
    resource.errors[field].any? ? "invalid-field" : ""
  end

  def invalid_field_message(resource, field)
    resource.errors[field].any? ? format_invalid_field_message(resource.errors[field].first) : ""
  end

  def format_invalid_field_message(message)
    message.titleize
  end
end
