module WorkflowEngine
  module Actors
    class Cancel

      attr_reader :role

      def initialize(role)
        @role = role
      end
    end
  end
end
