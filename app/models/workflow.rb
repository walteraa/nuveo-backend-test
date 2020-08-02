# frozen_string_literal: true

# This class represents the Workflow model
class Workflow < ApplicationRecord
  enum status: %i[inserted consumed]

  after_create :enqueue_workflow

  private

  def enqueue_workflow
    queue = Amqp::RabbitClient.new
    queue.push id
  end
end
