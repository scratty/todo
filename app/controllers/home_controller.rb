class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]

  def admin
    #TODO: fetch Project Manager specific tasks
    @developer_tasks = Task.joins(:user)
      .select('tasks.*, users.email')
      .group_by(&:email)
    @project_tasks = Task.joins(:project)
      .select('tasks.*, projects.title as project_title')
      .group_by(&:project_title)
  end


  def developer
    @project_tasks = Task.joins(:project)
      .select('tasks.*, projects.title as project_title')
      .where(user: current_user)
      .group_by(&:project_title)
  end
end
