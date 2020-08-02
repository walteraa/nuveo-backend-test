module ControllersMixins
  module WorkflowMixin
    private

    # Use callbacks to share common setup or constraints between actions.
    def set_workflow
      @workflow = Workflow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def workflow_params
      params.require(:data)
      params.require(:steps)
      params.permit(data: {}, steps: []).to_h
    end

    def workflow_update_params
      params.require(:status)
      params.permit(:status).to_h
    end

    def reenqueue_job
      if workflow_update_params.dig(:status).eql? 'inserted' && @workflow.consumed?
       #TODO: Add the workflow ID in the queue again if the 
      end
    end
  end
end
