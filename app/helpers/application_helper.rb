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

        text = text.gsub ':bl:', "<span style='color: #0df; font-size: 24px;'>&#9724;</span>"
        text = text.gsub ':bk:', "<span style='color: #000; font-size: 24px;'>&#9724;</span>"
        text = text.gsub ':gr:', "<span style='color: #0a0; font-size: 24px;'>&#9830;</span>"
        text = text.gsub ':pu:', "<span style='color: #608; font-size: 24px;'>&#9830;</span>"
        text = text.gsub ':ye:', "<span style='color: #ff0; font-size: 20px;'>&#11042;</span>"
        text = text.gsub ':re:', "<span style='color: #a00; font-size: 20px;'>&#11042;</span>"
        text = text.gsub ':wh:', "<span style='color: #fff; font-size: 20px;'>&#11042;</span>"

        return text.html_safe

    end

end
