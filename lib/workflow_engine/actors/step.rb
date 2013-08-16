module WorkflowEngine
  module Actors
    class Step

      attr_reader :role

      def initialize(role)
        @role = role
        add_role
        execute
      end

      def classified_role
        @role.gsub('.', '/').classify.constantize
      end

      def add_role
        self.extend(classified_role)
        (class << self; self; end).class_eval do
          define_method 'role?' do
            role
          end
        end
      end

      def timeout_time
        60
      end

      def reraise(error)
        @thread_error = error
      end

      def up
        raise 'Should be overwritten'
      end

      def execute
        Thread.new do
          begin
            Timeout::timeout(timeout_time) do
              up
            end
          rescue Exception
            reraise $!.to_s
          end
        end.join
      ensure
        raise @thread_error if @thread_error
      end
    end
  end
end
