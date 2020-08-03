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

    def reenqueue_workflow
      if workflow_update_params.dig(:status).eql? 'inserted' && @workflow.consumed?
        queue = Amqp::RabbitClient.new
        queue.push @workflow.id
      end
    end

    def set_workflow_from_queue
      queue = Amqp::RabbitClient.new
      @workflow_id = queue.pop
    end

    def generate_csv
      workflow = Workflow.find @workflow_id
      data = workflow.data
      ::CSV.generate do |csv|
        csv << data.keys
        csv << data.values
      end
    end
  end
end
