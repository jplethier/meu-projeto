# -*- coding: utf-8 -*-
class UsersController < ApplicationController

    before_filter :correct_user, :only => [:edit, :update]
    before_filter :authenticate_user!, :only => [:edit, :update, :show, :index]

    def edit
        @user = current_user
        @title = "Alterar Dados"
    end

    def show
        @user = User.find(params[:id])
        @ofertas = @user.ofertas.paginate(:page => params[:page])
        @title = @user.name
        if not current_user? @user
        end
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

    def index
        @title = "Lista de Usuários"
        @users = User.order(:name).page(params[:page]).per(30)
    end

    private
            def correct_user
                @user = User.find(params[:id])
                redirect_to(root_path) unless current_user?(@user)
            end


end
