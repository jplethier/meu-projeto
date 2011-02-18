class OfertasController < ApplicationController

    before_filter :authenticate, :only => [:create, :destroy]

    def create
        @oferta  = current_user.ofertas.build(params[:oferta])
        if @oferta.save
            flash[:success] = "Oferta criada com sucesso!"
            redirect_to root_path
        else
            render "pages/home"
        end
    end

    def destroy
    end

end
