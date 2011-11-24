module TopicsHelper
  def category_options(categories)
    categories.map{|c|[c.name,c.id]}
  end
end
