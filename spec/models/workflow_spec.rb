require 'rails_helper'

RSpec.describe Workflow, type: :model do
  describe 'Valid Workflow' do
    let (:workflow) { build(:workflow) }

    it { expect(workflow).to be_valid }
    it { expect(workflow.save).to be(true) }
  end

  describe 'Invalid workflow' do
    context 'invalid status' do
      it { expect { build(:workflow, :with_invalid_statys) }.to  raise_error(ArgumentError)}
    end
  end

  describe 'Eneuque the workflow on Broker' do
    let (:workflow) { create(:workflow) }
    let (:broker) { Amqp::RabbitClient.new }

    before do
      broker.purge 
    end

    it { expect(workflow.id).to eq(broker.pop) }
  end
end
