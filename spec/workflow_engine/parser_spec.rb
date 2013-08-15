require 'spec_helper'

puts 'ok'
describe WorkflowEngine::Parser do

  describe 'with an if statement' do
    it 'should parse it' do
      input = 'if [bling]'
      workflow = WorkflowEngine::Parser.new(input)
      expected_output = [[:if, [[:expression, "bling"]]]]
      expect(workflow.to_array).to eq(expected_output)
    end
  end

  describe 'with a step statement' do
    it 'should parse it' do
      input = 'step blah.die_blink'
      workflow = WorkflowEngine::Parser.new(input)
      expected_output = [[:step, 'blah.die_blink']]
      expect(workflow.to_array).to eq(expected_output)
    end
  end

  describe 'with a concurrent statement' do
    it 'should parse it' do
      input = "concurrent\nstep blah.die_blond\nif [blond]\nend"
      workflow = WorkflowEngine::Parser.new(input)
      expected_output = [[:concurrent, [[:step, 'blah.die_blond'],
                                       [:if, [[:expression, "blond"]]]]]]
      expect(workflow.to_array).to eq(expected_output)
    end
  end
end
