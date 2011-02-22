class OfertasController < ApplicationController

    before_filter :authenticate, :only => [:create, :destroy, :novaoferta, :index]

    def novaoferta
        @oferta = Oferta.new
        @title = "Cadastro de Oferta"
    end

    def create
        @oferta  = current_user.ofertas.build(params[:oferta])
        if @oferta.save
            flash[:success] = "Oferta cadastrada com sucesso!"
            redirect_to root_path
        else
            render "novaoferta"
        end
    end

    def destroy
    end

    def index
        @ofertas = Oferta.paginate(:page => params[:page])
    end

end
