# frozen_string_literal: true

# This class represents the Workflow model
class Workflow < ApplicationRecord
  enum status: %i[inserted consumed]
end
