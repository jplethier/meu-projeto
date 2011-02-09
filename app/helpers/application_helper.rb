module ApplicationHelper

    def title
        base_title = "Meu Projeto"
        if @title.nil? or @title.empty?
            base_title
        else
            "#{base_title} | #{@title}"
        end
    end
end
