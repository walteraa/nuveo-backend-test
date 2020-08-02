class ConsumeWorkflowJob < ApplicationJob
  queue_as :workflows

  def perform(workflow_id)
    workflow = Workflow.find workflow_id

    return if workflow.consumed?

    # Do whatever more you want with the Workflow
    workflow.update(status: 'consumed')
  end
end
