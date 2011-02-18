# -*- coding: utf-8 -*-
class PagesController < ApplicationController
    
    def home
        @title = "Página inicial"
        @oferta = Oferta.new if signed_in?
    end

end
