# -*- coding: utf-8 -*-
class UsersController < ApplicationController

    before_filter :authenticate, :only => [:edit]

    def edit
        @user = current_user
        @title = "Alterar Dados"
    end

    def show
        @user = User.find(params[:id])
        @title = @user.name
    end
    
    def novocadastro
        @user = User.new
        @title = "Cadastro de Usuário"        
    end

    def create
        @user = User.new(params[:user])
        if @user.save
            sign_in @user  
            flash[:success] = "Cadastro efetuado com sucesso!"
            redirect_to @user
        else
            @title = "Cadastro de Usuário"
            render 'novocadastro'
            @user.password = params[:user][:password]
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(params[:user])
            flash[:success] = "Perfil atualizado."
            redirect_to @user
        else
            @title = "Edit user"
            render 'edit'
        end
    end


end
