class TasksController < ApplicationController
  before_filter :load_list

  # GET /tasks
  # GET /tasks.json
  def index
    @list = List.find(params[:list_id])
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @list = List.find(params[:list_id])
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to list_task_path(@task.list, @task), notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to list_task_path(@task.list, @task), notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @list = current_user.lists.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    #@task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to @list, :notice => 'Task deleted' }
      #format.html { redirect_to list_url }
      format.json { head :no_content }
    end
  end
  
  private
    def load_list
      @list = List.find(params[:list_id])
    end
end
