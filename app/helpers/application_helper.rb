module ApplicationHelper
  def full_title(title)
    return 'Presto' if title == ''
    title + ' | Presto'
  end
end
