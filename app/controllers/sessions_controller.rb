# -*- coding: utf-8 -*-
class SessionsController < ApplicationController

    def create
        user = User.authenticate(params[:session][:email],
                           params[:session][:password])
        if user.nil?
            flash.now[:error] = "Senha ou e-mail incorreto."
            @title = "Página Inicial"
            render root_path
        else
            sign_in user
            flash[:success] = "Login efetuado com sucesso."
            redirect_to user
        end
    end

    def destroy
        sign_out
        redirect_to root_path
    end

end
