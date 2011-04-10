class Relation < ActiveRecord::Base

    attr_accessor :e_seguido
    attr_accessible :e_seguido

    belongs_to  :segue,     :class_name => "User"
    has_one     :e_seguido, :class_name => "User"

end
