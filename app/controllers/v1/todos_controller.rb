module V1
  class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :update, :destroy]
    
    # GET /todos
    def index
      # get current user todos
      @todos = current_user.todos
      json_response(@todos)
    end

    # POST /todos
    def create
      # create todos belonging to current user
      @todo = current_user.todos.create!(todo_params)
      json_response(@todo, :created)
    end

    # GET /todos/:id
    def show
      json_response(@todo)
    end

    # PUT /todos/:id
    def update
      @todo.update!(todo_params)
      head :no_content
    end

    # DELETE /todos/:id
    def destroy
      @todo.destroy
      head :no_content
    end

    private

    # Find todo by id for actions that require it
    def set_todo
      @todo = current_user.todos.find(params[:id])
    end

    # Strong parameters to allow only title to be updated/created
    def todo_params
      params.permit(:title)
    end
  end
end
