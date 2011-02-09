# -*- coding: utf-8 -*-
class UsersController < ApplicationController
    
    def novocadastro
        @user = User.new
        @title = "Cadastro de Usuário"        
    end

end
