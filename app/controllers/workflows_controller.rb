class WorkflowsController < ApplicationController
  before_action :set_workflow, only: [:show, :update, :destroy]

  # GET /workflows
  # GET /workflows.json
  def index
    @workflows = Workflow.all
  end

  # GET /workflows/1
  # GET /workflows/1.json
  def show
  end

  # POST /workflows
  # POST /workflows.json
  def create
    @workflow = Workflow.new(workflow_params)

    if @workflow.save
      render :show, status: :created, location: @workflow
    else
      render json: @workflow.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workflows/1
  # PATCH/PUT /workflows/1.json
  def update
    if @workflow.update(workflow_params)
      render :show, status: :ok, location: @workflow
    else
      render json: @workflow.errors, status: :unprocessable_entity
    end
  end

  # DELETE /workflows/1
  # DELETE /workflows/1.json
  def destroy
    @workflow.destroy
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
