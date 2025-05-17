class AddDepartamentoIdToProduto < ActiveRecord::Migration[8.0]
  def change
    add_column :produtos, :departamento_id, :integer
  end
end
