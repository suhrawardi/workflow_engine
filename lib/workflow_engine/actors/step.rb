module WorkflowEngine
  module Actors
    class Step

      attr_reader :role

      def initialize(role)
        @role = role
      end
    end
  end
end
