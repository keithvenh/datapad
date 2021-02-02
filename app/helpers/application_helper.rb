module ApplicationHelper

    def display_level(level, max_level=true)

        display = "<div class='level-display'>"
        i = 1
        level.times do 
            display += "<div class='level level-true level-#{i}'></div>"
            i += 1
        end
        if max_level
            (5 - level).times do 
                display += "<div class='level level-false level-#{i}'></div>"
                i += 1
            end
        end

        display += "</div>"

        return display.html_safe
    end

end
