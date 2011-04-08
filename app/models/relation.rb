class Relation < ActiveRecord::Base

    belongs_to :segue,     :class_name => "User"
    belongs_to :e_seguido, :class_name => "User"

    
end
