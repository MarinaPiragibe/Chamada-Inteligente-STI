class CreateChamada < ActiveRecord::Migration[7.0]
  def change
    create_table :chamadas do |t|
      t.string :hora_assinada
      t.string :dia_assinado
      t.timestamps
    end
  end
end
