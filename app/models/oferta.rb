# -*- coding: utf-8 -*-
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

    before_save :ignorarAcentosTipo                            

    default_scope :order     => 'ofertas.created_at DESC'
    scope :ofertas_do_dia,   where("created_at >= ?", Time.mktime(Time.now.year, Time.now.month, Time.now.day, 0, 0, 0))
    scope :por_tipo

    def self.por_tipo(tipo)
        where("tipo = ?", tipo)        
    end

    def tipos_de_oferta
        {"beleza e saude" => "Beleza e Saúde", "celulares e telefones" => "Celulares e Telefones", "dvds e vds" => "DVDs e CDs",        
         "eletrodomesticos" => "Eletrodomésticos", "eletronicos" => "Eletrônicos", "esportes e lazer" => "Esportes e Lazer", 
         "informatica" => "Informática", "livros" => "Livros", "roupas e calcados" => "Roupas e Calçados", "viagens" => "Viagens"}
    end

    def tipo_string
        tipos_de_oferta[self.tipo]
    end

    private 
        
        def ignorarAcentosTipo
            self.tipo = self.tipo.downcase.mb_chars.normalize(:kd).gsub(/[^a-z0-9\s\._]/n, '').to_s
        end

end
