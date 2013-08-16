require 'spec_helper'

describe WorkflowEngine::Actors::If do

  describe 'with an if definition' do

    pending 'tbd' do

    it 'should have a conditional statement' do
      input = [[:expression, "blah"], [[:step, "bloh"]]]
      step = WorkflowEngine::Actors::Step.new(input)
      expect(step.role).to eq(input)
    end

    it 'should have one or more actions to do' do
      input = [[:expression, "blah"], [[:step, "bloh"]]]
      step = WorkflowEngine::Actors::If.new(input)
      expect(step.role).to eq(input)
    end
    end
  end
end
