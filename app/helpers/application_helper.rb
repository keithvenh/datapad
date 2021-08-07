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
        if text
            text = text.gsub ':bl:', image_tag("icons/bl.png", class:"die-icon")
            text = text.gsub ':bk:', image_tag("icons/bk.png", class:"die-icon")
            text = text.gsub ':gr:', image_tag("icons/gr.png", class:"die-icon")
            text = text.gsub ':pu:', image_tag("icons/pu.png", class:"die-icon")
            text = text.gsub ':ye:', image_tag("icons/ye.png", class:"die-icon")
            text = text.gsub ':re:', image_tag("icons/re.png", class:"die-icon")
            text = text.gsub ':wh:', image_tag("icons/wh.png", class:"die-icon")

            text = text.gsub ':suc:', image_tag("icons/suc.png", class:"die-icon")
            text = text.gsub ':adv:', image_tag("icons/adv.png", class:"die-icon")
            text = text.gsub ':tri:', image_tag("icons/tri.png", class:"die-icon")
            text = text.gsub ':fai:', image_tag("icons/fai.png", class:"die-icon")
            text = text.gsub ':thr:', image_tag("icons/thr.png", class:"die-icon")
            text = text.gsub ':des:', image_tag("icons/des.png", class:"die-icon")
            text = text.gsub ':lsp:', image_tag("icons/lsp.png", class:"die-icon")
            text = text.gsub ':dsp:', image_tag("icons/dsp.png", class:"die-icon")
            text = text.gsub ':fp:', image_tag("icons/fp.png", class:"die-icon")

            return text.html_safe
        end

    end

end
