module TouchpointsHelper
    def all_touchpoints_by_label(type)
        touchpoints = Touchpoint.where(interaction_type: type).all

        return touchpoints
    end
    def get_interaction_label(i)
        unless i.nil?
            if (i<5) and (i>0) and (i.is_a? Integer)
                i-=1
                interaction_types[i]
            else
                ""
            end

        else
            ""
        end
    end

    def interaction_types
        ["Call", "Email", "Meeting", "Other"]
    end

    def get_touchpoint(type)
        interaction_types.index(type).to_i + 1
    end
end
