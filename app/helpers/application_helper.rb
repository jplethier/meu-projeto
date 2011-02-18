module ApplicationHelper

    def logo
        image_tag("small_logo.jpg", :class => "round")
    end

    def title
        base_title = "DealWit.Me"
        if @title.nil? or @title.empty?
            base_title
        else
            "#{base_title} | #{@title}"
        end
    end
end
