require 'spec_helper'

describe WorkflowEngine::Parser::Main do

  describe 'with an if statement' do

    it 'should parse it' do
      input = "if [bling]\nstep blonk\nend"
      workflow = WorkflowEngine::Parser::Main.new(input)
      expected_output = [[:if, [[:expression, 'bling'],
                               [[:step, 'blonk']]]]]
    end
  end

  describe 'with a step statement' do

    it 'should parse it' do
      input = 'step blah.die_blink'
      workflow = WorkflowEngine::Parser::Main.new(input)
      expected_output = [[:step, 'blah.die_blink']]
      expect(workflow.to_array).to eq(expected_output)
    end
  end

  describe 'with a concurrent statement' do

    it 'should parse it' do
      input = "concurrent\nstep blah.die_blond\nif [blond]\nstep blonk\nend\nend"
      workflow = WorkflowEngine::Parser::Main.new(input)
      expected_output = [[:concurrent, [[:step, 'blah.die_blond'],
                                        [:if, [[:expression, 'blond'],
                                        [[:step, 'blonk']]]]]]]
      expect(workflow.to_array).to eq(expected_output)
    end
  end

  describe 'with a cancel statement' do

    it 'should parse it' do
      input = 'cancel'
      workflow = WorkflowEngine::Parser::Main.new(input)
      expected_output = [[:cancel]]
      expect(workflow.to_array).to eq(expected_output)
    end
  end

  describe 'with a fail statement' do

    it 'should parse it' do
      input = 'fail'
      workflow = WorkflowEngine::Parser::Main.new(input)
      expected_output = [[:fail]]
      expect(workflow.to_array).to eq(expected_output)
    end
  end

  describe 'with a lot of statements' do

    before do
      @input = IO.read('spec/assets/simple_flow.conf')
      parser = WorkflowEngine::Parser::Main.new(@input)
      @workflow = parser.to_array
    end

    it 'has a step blah.die_blah' do
      expect(@workflow).to include([:step, 'blah.die_blah'])
    end

    it 'has the if expression blah' do
      expected_output = [:if, [[:expression, 'blah'],
                              [[:step, 'blah.die_bloh']]]]
      expect(@workflow).to include(expected_output)
    end

    describe 'and a concurrent block' do
      before do
        @concurrent = @workflow[2][1]
      end

      it 'has a step blah.die_bling' do
        expected_output = [:step, 'blah.die_bling']
        expect(@concurrent).to include(expected_output)
      end

      it 'has the if expression blond' do
        expected_output = [:if, [[:expression, 'blond'],
                                [[:step, 'blah.die_black']]]]
        expect(@concurrent).to include(expected_output)
      end
    end
  end
end
