require 'spec_helper'

describe WorkflowEngine::Director do

  describe 'with a given parsed workflow' do

    before(:all) do
      input = IO.read('spec/assets/simple_flow.conf')
      @parsed_flow = WorkflowEngine::Parser::Main.new(input).to_array
    end

    before do
      @director = WorkflowEngine::Director.new(@parsed_flow)
    end

    it 'will have the flow' do
      expect(@director.flow).to eq(@parsed_flow)
    end

    describe 'with steps' do

      it 'will initialize a step' do
        expect(WorkflowEngine::Actors::Step).to receive(:new).exactly(7).times
        @director.execute
      end 
    end

    describe 'with an if statement' do

      it 'will initialize an if statement' do
        expect(WorkflowEngine::Actors::If).to receive(:new).exactly(3).times
        @director.execute
      end 
    end

    describe 'with a concurrent statement' do

      it 'will initialize a concurrent statement' do
        expect(WorkflowEngine::Actors::Concurrent).to receive(:new).once
        @director.execute
      end 
    end
  end
end
