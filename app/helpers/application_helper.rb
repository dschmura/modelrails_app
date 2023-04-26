module ApplicationHelper
  # Creates skip to content links from an array of id names
  def skip_links
    sanitize @skip_links.collect { |skip_link| link_to (skip_link[1]).to_s, "#{request.url}/##{skip_link[0]}", class: "skip-to-content-link" }.join(" <span class='sr-only' > or </span>")
  end

  def tailwind_classes_for(flash_type)
    {
      notice: "bg-green-800 border-l-4 border-green-700 text-white opacity-90 group-hover:opacity-100 ",
      error: "bg-red-800 border-l-4 border-red-900 text-white opacity-90 group-hover:opacity-100",
      alert: "bg-red-800 border-l-4 border-red-900 text-white opacity-90 group-hover:opacity-100"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
