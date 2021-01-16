class TasksController < ApplicationController
  before_action :set_task, only: %i[show destroy update]

   def index
     tasks = Task.all.order(:id)
     render json: tasks, include: ['tags']
   end

   def show
     render json: @task, include: ['tags']
   end

   def create
     task = Task.new(task_params)
     if task.save
       render json: task, include: ['tags']
     else
       render json: task.errors
     end
   end

   def update
     # replace current tags 
     if @task.tags.clear() && @task.update(task_params)
       render json: @task, include: ['tags']
     else
       render json: @task.errors
     end
   end

   def destroy
     if @task.destroy
       render json: @task, include: ['tags']
     else
       render json: @task.errors
     end
   end

   private

   def set_task
     @task = Task.find(params[:id])
   end

   def task_params
     params.require(:task).permit(:name, tags_attributes: [:name])
   end
 end
