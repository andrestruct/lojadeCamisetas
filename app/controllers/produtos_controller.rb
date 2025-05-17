class ProdutosController < ApplicationController
  before_action :busca_produto, only: [ :edit, :update, :destroy ]
  def index
    @produtos_por_nome = Produto.order(:nome).limit 5
    @produtos_por_preco = Produto.order :preco
  end


  def new
    @produto = Produto.new
    renderiza :new
  end


  def busca
    # nome_a_buscar = "%#{params[:nome]}%"
    # @produtos = Produto.where "nome like ?", nome_a_buscar

    @nome_a_buscar = params[:nome]
    @produtos = Produto.where "nome like ?", "%#{@nome_a_buscar}%"
  end

  def edit
    # busca_produto
    renderiza :edit
  end

  def update
    # busca_produto
    if @produto.update produto_params
      flash[:notice] = "Produto atualizado com sucesso"
      redirect_to root_url
    else
      renderiza :edit
    end
  end


  def create
    @produto = Produto.new produto_params

    if @produto.save
      flash[:notice] = "Produto salvo com sucesso"
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    # id = params[:id]
    # Produto.destroy id
    # redirect_to root_url

    # busca_produto
    @produto.destroy
    redirect_to root_url
  end

  private
  def renderiza(view)
    @departamentos = Departamento.all
    render view
  end

  def busca_produto
    id = params[:id]
    @produto = Produto.find(id)
  end

  def produto_params
    params.require(:produto).permit :nome, :preco, :descricao, :quantidade, :departamento_id
  end
end
