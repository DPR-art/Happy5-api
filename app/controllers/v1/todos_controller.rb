module V1
  class TodosController < ApplicationController
    # [...]
    # GET /todos
    def index
      # get current user todos
      @todos = current_user.todos
      json_response(@todos)
    end
    # def index
    #   # get paginated current user todos
    #   @todos = current_user.todos.paginate(page: params[:page], per_page: 2)
    #   json_response(@todos)
    # end
    
    # [...]
    # POST /todos
    def create
      # create todos belonging to current user
      @todo = current_user.todos.create!(todo_params)
      json_response(@todo, :created)
    end
    
    # GET /todos/:id
    def show
      @todo = current_user.todos.create!(todo_params)
      json_response(@todo)
    end

    # PUT /todos/:id
    def update
      @todo = current_user.todos.create!(todo_params)
      @todo.update(todo_params)
      head :no_content
    end

    # DELETE /todos/:id
    def destroy
      @todo = current_user.todos.create!(todo_params)
      @todo.destroy
      head :no_content
    end

    # [...]
    private

    # remove `created_by` from list of permitted parameters
    def todo_params
      params.permit(:title)
    end
    # [...]
  end
end