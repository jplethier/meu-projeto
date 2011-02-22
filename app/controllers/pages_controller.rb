# -*- coding: utf-8 -*-
class PagesController < ApplicationController
    
    def home
        @title = "Página inicial"
        if signed_in?
            @ofertas = Oferta.ofertas_do_dia
        end
    end

end
