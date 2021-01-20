class TasksController < ApplicationController
  before_action :set_task, only: %i[show destroy update]

   def index
     # get parent tasks
     tasks = Task.all.order(:id)
     # include all nested attributes recursively
     render json: tasks, include: ['tags', 'sub_tasks']
   end

   def show
     render json: @task, include: ['tags', 'sub_tasks']
   end

   def create
     task = Task.new(task_params)
     if task.save
       render json: task, include: ['tags','sub_tasks']
     else
       render json: task.errors
     end
   end

   def update
     # replace current tags
     if @task.tags.clear() && @task.update(task_params)
       render json: @task, include: ['tags', 'sub_tasks']
     else
       render json: @task.errors
     end
   end

   def destroy
     if @task.destroy
       render json: @task, include: ['tags', 'sub_tasks']
     else
       render json: @task.errors
     end
   end

   private

   def set_task
     @task = Task.find(params[:id])
   end

   def task_params
     params.require(:task).permit(:parent_task_id, :name, :completed, tags_attributes: [:name])
   end
 end
