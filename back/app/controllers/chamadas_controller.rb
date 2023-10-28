class ChamadasController < ApplicationController
    def marcarPresenca
        @presenca = Chamada.create(professors_id: params[:professors_id], turmas_id: params[:turmas_id], alunos_id: params[ :alunos_id], hora_assinada: params[:hora_assinada], dia_assinado: params[:dia_assinado])
        if @presenca.save
            render json: @presenca, :status => :ok
        end
    end

    def show
        @presencas = Chamada.all
        render json: @presencas
    end
end
