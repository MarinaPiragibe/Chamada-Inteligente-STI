require 'date'
require 'i18n'
class ChamadasController < ApplicationController 
    def marcarPresenca
        @presenca = Chamada.create(professors_id: params[:professors_id], turmas_id: params[:turmas_id], alunos_id: params[ :alunos_id], hora_assinada: params[:hora_assinada], dia_assinado: params[:dia_assinado])
        if @presenca.save
            render json: @presenca, :status => :ok
        end
    end


    def verificarAssinaturaAluno
        dia_hoje = params[:dia] +'/'+params[:mes]+'/'+params[:ano]
        @presenca = Chamada.where("alunos_id = ? and turmas_id = ? and dia_assinado = ?", params[:id],params[:turma_id], dia_hoje)
        if @presenca.empty?
            puts "Liberado Fazer chamada"
            render json: true, :status => :ok
        else
        puts "Já assinou esse dia!"
        render json: false, :status => :bad_request
    end
    end
end