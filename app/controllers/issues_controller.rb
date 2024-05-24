class IssuesController < ApplicationController
  def index
    project = Project.first
    @issues = project.issues.joins(:user,:project).select("issues.id, projects.name as project_name, issues.tracker, issues.status, issues.priority,issues.title, users.name as user_name, issues.updated_at")
  end
end
