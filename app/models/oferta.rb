class Oferta < ActiveRecord::Base

    attr_accessible :title, :description, :link, :tipo, :price_mask

    composed_of :price_mask, :class_name => "Dinheiro", :mapping => %w(price valor),
        :converter => Proc.new{|valor|  Dinheiro.new(valor.to_number)}

    belongs_to :user
    has_many :comments, :dependent => :destroy

    validates :user_id,     :presence => true
    validates :title,       :presence => true,
                            :length => { :maximum => 255 }
    validates :description, :presence => true,
                            :length => { :maximum => 1500 }
    validates :link,        :presence => true
    validates :tipo,        :presence => true
                            

    default_scope :order     => 'ofertas.created_at DESC'
    scope :ofertas_do_dia,   where("created_at >= ?", Time.mktime(Time.now.year, Time.now.month, Time.now.day, 0, 0, 0))
    scope :por_tipo

    def self.por_tipo(tipo)
        where("tipo = ?", tipo)        
    end

end
