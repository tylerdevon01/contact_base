module PipelinesHelper
    def deals_with(label)
        pipeline = Pipeline.find_by(id:params[:id])
        deals = pipeline.deals

        return deals.where(label: label).all
    end
    def get_label_text(i)
        unless i.nil?
            if (i<5) and (i>0) and (i.is_a? Integer)
                i-=1
                label_options[i]
            else
                ""
            end

        else
            ""
        end
    end

    def label_options
        ["Lead", "Prospect", "Oppurtunity", "Deal"]
    end

    def get_label(label_heading)
        label_options.index(label_heading).to_i + 1
    end
end
