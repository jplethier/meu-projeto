# -*- coding: utf-8 -*-
class UsersController < ApplicationController
    
    def novocadastro
        @user = User.new
        @title = "Cadastro de Usuário"        
    end

    def create
        @user = User.new(params[:user])
        if @user.save
#            sign_in @user  
            flash[:success] = "Cadastro efetuado com sucesso!"
            redirect_to @user
        else
            @title = "Cadastro de Usuário"
            render 'novocadastro'
            @user.password = params[:user][:password]
        end
    end

end
