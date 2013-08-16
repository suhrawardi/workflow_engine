require 'spec_helper'

describe WorkflowEngine::Director do

  describe 'with a given parsed workflow' do

    before(:all) do
      input = IO.read('spec/assets/simple_flow.conf')
      @parsed_workflow = WorkflowEngine::Parser::Main.new(input)
    end

    it 'will have the flow' do
      director = WorkflowEngine::Director.new(@parsed_flow)
      expect(director.flow).to eq(@parsed_flow)
    end

    describe 'with steps' do
      it 'will create a step' do
      end 
    end
  end
end
