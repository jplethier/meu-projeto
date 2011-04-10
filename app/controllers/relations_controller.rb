# -*- coding: utf-8 -*-
class RelationsController < ApplicationController

    def create
        user = User.find(params[:user_id])
        @relation = current_user.usuarios_seguidos.build
        @relation.e_seguido = user
        if @relation.save
            flash[:success] = "Operação efetuada com sucesso!"
        else
            flash[:error] = "Não foi possível seguir este usuário!"
        end
        redirect_to @relation.e_seguido
    end

end
