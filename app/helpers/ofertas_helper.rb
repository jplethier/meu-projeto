# -*- coding: utf-8 -*-
module OfertasHelper

    def options_para_tipos(selected)
        opcoes = ["","Bebidas", "Beleza e Saúde", "Celulares e Telefones", "DVDs e CDs", "Eletrodomésticos", "Eletrônicos", "Esportes e Lazer", "Informática", "Livros", "Roupas e Calçados", "Viagens"]
        options_for_select(opcoes, selected)
    end

end
