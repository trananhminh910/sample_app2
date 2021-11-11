module ApplicationHelper
  def full_title page_title = ""
    base_title = t("rails_tutorial_title")
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end
end
