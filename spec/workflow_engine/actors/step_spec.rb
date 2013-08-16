require 'spec_helper'

describe WorkflowEngine::Actors::Step do

  describe 'with a step definition' do

    it 'should have a role' do
      input = 'ladie.da_die_dah'
      step = WorkflowEngine::Actors::Step.new(input)
      expect(step.role).to eq(input)
    end
  end
end
