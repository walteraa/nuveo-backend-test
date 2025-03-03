# frozen_string_literal: true

FactoryBot.define do
  factory :workflow do
    data { { key1: 'value1', key2: 'value2' } }
    status { Workflow.statuses.keys.sample }
    steps { %w[add commit push] }

    trait :with_invalid_statys do
      status { 'invalid_status' }
    end
  end
end
