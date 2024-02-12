# frozen_string_literal: true

module ApplicationHelper
    def page_title(page_title = '')
        base_title = '断捨離memo'
        
        page_title.empty? ? base_title : page_title + ' | ' + base_title
    end

    def deadline_options
        [
          ['指定なし', nil],
          ['15日以内', 15.days.from_now],
          ['30日以内', 30.days.from_now]
        ]
    end
end
