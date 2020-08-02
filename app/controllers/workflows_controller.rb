require 'csv'

class WorkflowsController < ApplicationController
  include ::ControllersMixins::WorkflowMixin
  before_action :set_workflow, only: %i[show update destroy]
  before_action :reenqueue_workflow, only: %i[update]
  before_action :set_workflow_from_queue, only: %i[consume]

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

  # GET /workflow/consume
  def consume
    if @workflow_id.nil?
      head :no_content
    else
      ConsumeWorkflowJob.perform_later(@workflow_id)
      respond_to do |format|
        format.csv do
          send_data generate_csv
        end
      end
    end
  end
end
