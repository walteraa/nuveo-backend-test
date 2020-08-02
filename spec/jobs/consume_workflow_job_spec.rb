require 'rails_helper'

RSpec.describe ConsumeWorkflowJob, type: :job do
  ActiveJob::Base.queue_adapter = :test

  describe '.perform' do

    context 'updates the workflow to update status to consumed' do
      let(:workflow) { create(:workflow, status: 'inserted') }
      it do
        expect(described_class.perform_now(workflow.id)).to be(true)
        expect(workflow.reload.status).to eq('consumed')
      end
    end

    context 'skips the flow if workflow already consumed' do
      let(:workflow) { create(:workflow, status: 'consumed') }

      it do
        expect(described_class.perform_now(workflow.id)).to be(nil)
      end
    end
  end
end
