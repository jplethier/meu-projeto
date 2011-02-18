# -*- coding: utf-8 -*-
class PagesController < ApplicationController
    
    def home
        @title = "Página inicial"
        if signed_in?
            @oferta = Oferta.new 
            @ofertas = Oferta.paginate(:page => params[:page])
        end
    end

end
