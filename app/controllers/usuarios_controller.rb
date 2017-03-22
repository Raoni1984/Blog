class UsuariosController < ApplicationController
  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(params[user_params])
    if @usuario.save
      redirect_to new_usuario_path
    end
  end

  def user_params
    params.require(:usuario).permit(:nome, :sobrenome, :email, :empresa, :datahora)
  end

  def index
    @usuarios = Usuario.all
    # Patching all Listing

    @usuario = Usuario.where(id: params[:id]) if params[:id].present?
    # Find By Id (For pagination, the 'where' statement result is Listing ActiveRecord::Relationship )
    @usuarios = @usuarios.search(params[:search]) if params[:search].present?
    # Search using Keyword
    @usuarios = @usuarios.paginate(:page => params[:page], :per_page => 10)
    # Pagination
    @usuario = Usuario.find_by_name(params[:name]) if params[:name].present?
    # # Find User using name column
    # @categories = Category.all

  end

end
