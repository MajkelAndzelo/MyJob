class BootstrapLinkRenderer < WillPaginate::ActionView::LinkRenderer
    protected
  
    def html_container(html)
      tag :nav, tag(:ul, html, class: 'pagination')
    end
  
    def page_number(page)
      tag :li, link(page, page, rel: rel_value(page), class: 'page-link'), class: 'page-item'
    end
  
    def gap
      tag :li, link(super, '#', class: 'page-link'), class: 'page-item disabled'
    end
  
    def previous_or_next_page(page, text, classname)
      tag :li, link(text, page || '#', class: 'page-link'), class: "page-item #{classname}"
    end
  
    def previous_page
      num = @collection.current_page > 1 && @collection.current_page - 1
      previous_or_next_page(num, '<span aria-hidden="true">&laquo;</span> Previous'.html_safe, 'previous')
    end
  
    def next_page
      num = @collection.current_page < total_pages && @collection.current_page + 1
      previous_or_next_page(num, 'Next <span aria-hidden="true">&raquo;</span>'.html_safe, 'next')
    end
  end
  