# -*- coding: utf-8 -*-
class PagesController < ApplicationController
    
    def home
        @title = "Página inicial"
        if signed_in?
            if params[:tipo]
                @ofertas = Oferta.ofertas_do_dia.por_tipo(params[:tipo])
            else
                @ofertas = Oferta.ofertas_do_dia
            end
        end
    end

end
