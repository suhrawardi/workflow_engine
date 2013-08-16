module WorkflowEngine
  class Director

    attr_reader :flow

    def initialize(flow)
      @flow = flow
    end
  end
end
