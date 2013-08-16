module WorkflowEngine
  module Actors
    class Step

      attr_reader :role

      def initialize(role)
        @role = role
        execute
      end

      def execute
        puts "executing #{role}"
      end
    end
  end
end
