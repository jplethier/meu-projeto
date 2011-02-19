class Oferta < ActiveRecord::Base

    attr_accessible :title, :description, :price, :link

    belongs_to :user

    validates :user_id,     :presence => true
    validates :title,       :presence => true,
                            :length => { :maximum => 15 }
    validates :description, :presence => true,
                            :length => { :maximum => 255 }
    validates :price,       :presence => true,
                            :numericality => true
    validates :link,        :presence => true

    default_scope :order => 'ofertas.created_at DESC'
end
