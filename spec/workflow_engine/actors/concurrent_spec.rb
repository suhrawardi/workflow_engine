require 'spec_helper'

describe WorkflowEngine::Actors::Concurrent do

  describe 'with a concurrent definition' do

    pending 'tbd' do

    it 'should have have one or more actions to do' do
      input = [:concurrent, [[:step, "blah.die_bling"],
                             [:step, "blah.die_blond"],
                             [:if, [[:expression, "blond"],
                                   [[:step, "black"]]]]]]
      step = WorkflowEngine::Actors::Concurrent.new(input)
      expect(step.role).to eq(input)
    end
    end
  end
end
