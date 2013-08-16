module WorkflowEngine
  module Actors
    class Expression

      attr_reader :role

      def initialize(role)
        @role = role
      end

      def evaluate
        puts "evaluating #{role}"
        true
      end
    end
  end
end
