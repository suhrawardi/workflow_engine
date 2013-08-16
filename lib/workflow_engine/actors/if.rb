module WorkflowEngine
  module Actors
    class If

      def initialize(flow)
        WorkflowEngine::Director.new(flow[1]).execute if evaluate(flow[0])
      end

      def evaluate(item)
        !!WorkflowEngine::Actors::Expression.new(item[1]).evaluate
      rescue
        raise "No actors found for expression #{item[1]}" << $!.to_s
      end
    end
  end
end
