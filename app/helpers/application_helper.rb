module ApplicationHelper
  def active(path)
    if current_page?(path)
      "active"
    else
      ""
    end
  end
end
