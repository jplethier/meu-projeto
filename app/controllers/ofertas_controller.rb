class OfertasController < ApplicationController

    before_filter :authenticate_user!, :only => [:create, :destroy, :novaoferta, :index]

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

    def todas_ofertas
        if params[:tipo]
           @ofertas = Oferta.paginate(:page => params[:page], :per_page => 20, :conditions => ["tipo = :tipo", {:tipo => params[:tipo]}])
        else
            @ofertas = Oferta.paginate(:page => params[:page], :per_page => 20)
        end
    end

    def ofertas_do_dia
        if params[:tipo]
            @ofertas = Oferta.ofertas_do_dia.por_tipo(params[:tipo])
        else
            @ofertas = Oferta.ofertas_do_dia
        end
    end

    def show
        @oferta = Oferta.find(params[:id])
        @title = @oferta.title + " - R$" + @oferta.price_mask.to_s
        @comment = Comment.new
        @comments = @oferta.comments
    end


end
