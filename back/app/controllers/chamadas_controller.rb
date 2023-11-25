require 'date'
require 'i18n'
class ChamadasController < ApplicationController
    
    def verificarChamadasAluno
    #Recupera o dia atual
    I18n.locale = :pt
    dia_da_semana = I18n.l(Date.today, format: '%A')
    @turmas = Turma.joins(aluno_pertence_turmas: :aluno).where("aluno_id = ?",params[:id])
    lista_turmas_fazer_chamada = []
    for turma in @turmas do
        for dia_aula in turma.dias.split("\n")
            if dia_aula === dia_da_semana
                lista_turmas_fazer_chamada.push(i)
            end
        end
      
    end
    if(lista_turmas_fazer_chamada != [])
        puts "Tem chamada hoje"
    end
    puts"Sem chamada para esse camarada!"
    
    end

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
