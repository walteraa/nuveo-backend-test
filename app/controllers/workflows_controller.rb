class WorkflowsController < ApplicationController
  before_action :set_workflow, only: %i[show update destroy]

  # GET /workflows
  def index
    @workflows = Workflow.all
  end

  # GET /workflows/1
  def show
  end

  # POST /workflows
  def create
    @workflow = Workflow.new(workflow_params)

    if @workflow.save
      render :show, status: :created, location: @workflow
    else
      render json: @workflow.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workflows/1
  def update
    if @workflow.update(workflow_params)
      render :show, status: :ok, location: @workflow
    else
      render json: @workflow.errors, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workflow
      @workflow = Workflow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def workflow_params
      params.fetch(:workflow, {})
    end
end
