class Comment < ActiveRecord::Base

    attr_accessible :content, :oferta
    attr_accessor :oferta

    belongs_to :user
    belongs_to :oferta

    validates :user_id,     :presence => true
    validates :oferta_id,   :presence => true
    validates :content,     :presence => true,
                                :length => { :maximum => 1500 }
    

end
