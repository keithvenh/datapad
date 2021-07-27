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

    def replace_dice(text)

        text = text.gsub ':bl:', image_tag("icons/bl.png", class:"die-icon")
        text = text.gsub ':bk:', image_tag("icons/bk.png", class:"die-icon")
        text = text.gsub ':gr:', image_tag("icons/gr.png", class:"die-icon")
        text = text.gsub ':pu:', image_tag("icons/pu.png", class:"die-icon")
        text = text.gsub ':ye:', image_tag("icons/ye.png", class:"die-icon")
        text = text.gsub ':re:', image_tag("icons/re.png", class:"die-icon")
        text = text.gsub ':wh:', image_tag("icons/wh.png", class:"die-icon")

        return text.html_safe

    end

end
