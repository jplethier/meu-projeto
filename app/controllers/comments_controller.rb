class CommentsController < ApplicationController
    
    before_filter :authenticate_user!

    def create
        @comment = current_user.comments.build(params[:comment])
        @comment.oferta = Oferta.find(params[:oferta_id])
        if @comment.save
            flash[:succes]
            redirect_to @comment.oferta
        else
            redirect_to root_path
        end
    end

end
