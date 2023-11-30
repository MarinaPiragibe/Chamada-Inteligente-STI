class TurmasController < ApplicationController


  # GET /turmas/1 or /turmas/1.json
  #Recupera turma com o professor e disciplina
  def show
    @turma = Turma.find(params[:id])
    @professor = Professor.where("id = ?",@turma.professors_id)
    @disciplina = Disciplina.where("id = ?",@turma.disciplinas_id)

    
  end

  #Recupera turmas do aluno
  def turmasAluno
    @turmas = Turma.joins(aluno_pertence_turmas: :aluno).where("aluno_id = ?",params[:id])
    lista_turmas = []
    for i in @turmas do
      lista_turmas.push(i)
    end
    if(lista_turmas != [])
    render json: lista_turmas, :status => :ok
    else
      error = {
        error: "Sem turma inscritas!"};
      render :json => error, :status => :bad_request
    end
  end


  def turmasProfessor
    @turmas = Turma.where("professors_id = ?",params[:id])
    lista_turmas = []
    for i in @turmas do
      lista_turmas.push(i)
    end
    if(lista_turmas != [])
    render json: lista_turmas, :status => :ok
    else
      error = {
        error: " Sem turma para ministrar!"};
      render :json => error, :status => :bad_request
    end
  end


  def verificarAulasDiaProfessor
    #Recupera o dia atual
    I18n.locale = :pt
    dia_da_semana = I18n.l(Date.today, format: '%A')
    @turmas = Turma.where("professors_id = ?",params[:id])
    lista_turmas_fazer_chamada = []
    for turma in @turmas do
        for dia_aula in turma.dias.split("\n")
            if dia_aula === dia_da_semana
                lista_turmas_fazer_chamada.push(i)
            end
        end
      
    end
    if(lista_turmas_fazer_chamada != [])
        puts "Tem aula hoje"
    end
    puts"Sem chamada para esse camarada!"
    
    end

def recuperarChamadaAluno()
  #require_relative 'CalcularDistancia'
  #Pegar dia da semana
  I18n.locale = :pt
  dia_da_semana = I18n.l(Date.today, format: '%A')
  #Pegar hora atual
  t = Time.now
  horario_atual = t.strftime("%H")
  #Pegar as turmas do aluno especifico
  @turmas = Turma.joins(aluno_pertence_turmas: :aluno).where("aluno_id = ?",params[:id])
  @aluno = Aluno.find(params[:id])
  for turma in @turmas do
    @professor = Professor.find(turma.professors_id)
    #Tiro os colchetes
    diasTurma = turma.dias.gsub(/[\[\]"]/, '')
    diasTurma = diasTurma.split(',')
    if @professor.online == 1
    #Verificando cada dia da turma
      for diaAula in diasTurma do
          #Tirando espaço vazio da string
          diaAula = diaAula.lstrip
          #Verificar se a chamada esta ativa, naquele dia e no horario de aula
          if turma.chamada_ativa == 1 and diaAula == dia_da_semana and turma.hora_inicio <= horario_atual.to_i and turma.hora_fim > horario_atual.to_i
            if CalcularDistancia.calcular_distancia(@aluno.latitude.to_f, @aluno.longitude.to_f, @professor.latitude.to_f, @professor.longitude.to_f) < 5
              chamada_aula_ativa = turma
            end
          end
      end
    end
    
  end
if(chamada_aula_ativa)
  render json: chamada_aula_ativa, :status => :ok
else
  error = {
    error: " Sem Chamada aberta para assinar!"};
  render :json => error, :status => :bad_request
end
  
end

def atualizarTurma
  @turma = Turma.find(id: params[:id])
  if @turma.chamada_ativa == 0
    @turma.update(chamada_ativa:1)
    render json: @turma, :status => :ok
  end
  @turma.update(chamada_ativa:0)
  render json: @turma, :status => :ok
end

def ligarChamada
  turma = Turma.find(params[:id])
  if turma.chamada_ativa == 0
    turma.update(chamada_ativa:1)
    render json: turma, :status => :ok
  end
end

def desligarChamada
  turma = Turma.find(params[:id])
  if turma.chamada_ativa == 1
    turma.update(chamada_ativa:0)
    render json: turma, :status => :ok
  end
end

def verificarAulasDiaAluno
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



end
