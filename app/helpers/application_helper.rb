module ApplicationHelper
  # Creates skip to content links from an array of id names
  def skip_links
    sanitize @skip_links.collect { |skip_link| link_to (skip_link[1]).to_s, "#{request.url}/##{skip_link[0]}", class: "skip-to-content-link" }.join(" <span class='' > or </span>")
  end

end
