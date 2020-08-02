class WorkflowsController < ApplicationController
  include ::ControllersMixins::WorkflowMixin
  before_action :set_workflow, only: %i[show update destroy]
  before_action :reenqueue_job, only: %i[update]

  # GET /workflows
  def index
    @workflows = Workflow.order('workflows.created_at ASC').all
  end

  # GET /workflows/{UUID}
  def show; end

  # POST /workflows
  def create
    @workflow = Workflow.new(workflow_params)

    if @workflow.save
      render :show, status: :created, location: @workflow
    else
      render json: @workflow.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workflows/{UUID}
  def update
    if @workflow.update(workflow_update_params)
      render :show, status: :ok, location: @workflow
    else
      render json: @workflow.errors, status: :unprocessable_entity
    end
  end
end
