class Comment < ActiveRecord::Base

    attr_accessible :comment

    belongs_to :user
    has_one :oferta

    validates :user_id,     :presence => true
    validates :oferta_id,   :presence => true
    validates :content,     :presence => true,
                                :length => { :maximum => 1500 }
    

end
