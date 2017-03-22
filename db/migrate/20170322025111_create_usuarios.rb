class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :sobrenome
      t.string :email
      t.string :datahora
      t.string :nome_empresa

      t.timestamps
    end
  end
end
