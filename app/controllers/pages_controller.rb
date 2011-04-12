# -*- coding: utf-8 -*-
class PagesController < ApplicationController
    
    def home
        @title = "Página inicial"
        if signed_in?
            if params[:tipo]
                @ofertas = Oferta.ofertas_por_usuario_ou_por_usuarios_seguidos(current_user).por_tipo(params[:tipo])
            else
                @ofertas = Oferta.ofertas_por_usuario_ou_por_usuarios_seguidos(current_user)
            end
        else
            @user = User.new
        end
    end

end
