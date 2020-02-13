module ApplicationHelper
    #ビューページごとにタイトルを割り振る
    def full_title(page_title="")
        base_title = "re_learn_app"
        if page_title.empty?
            base_title
        else
            page_title+" | "+base_title
        end
    end
end
