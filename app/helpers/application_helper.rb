module ApplicationHelper
  
  #ページごとのタイトルを表示
  def full_title(page_title = "")
    base_title = "RECIPES"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
