require 'will_paginate/view_helpers/action_view'
class BootstrapLinkRenderer < WillPaginate::ActionView::LinkRenderer
    protected
  
    def html_container(html)
      tag :nav, tag(:ul, html, class: "pagination")
    end
  
    def page_number(page)
      tag :li, link(page, page, rel: rel_value(page), class: 'page-link'), class: ('active' if page == current_page)
    end
  
    def previous_or_next_page(page, text, classname)
      tag :li, link(text, page || '#', class: 'page-link'), class: [classname[0..3], ('disabled' unless page), classname[4..-1]].join(' ')
    end
  
    def gap
      tag :li, link(super, '#', class: 'page-link'), class: 'disabled'
    end
  end
WillPaginate::ViewHelpers.pagination_options[:renderer] = BootstrapLinkRenderer
