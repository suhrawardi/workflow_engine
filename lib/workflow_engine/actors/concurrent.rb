module WorkflowEngine
  module Actors
    class Concurrent

      def initialize(flow)
        WorkflowEngine::Director.new(flow).execute
      end
    end
  end
end
