module WorkflowEngine
  module Actors
    class Fail

      attr_reader :role

      def initialize(role)
        @role = role
      end
    end
  end
end
