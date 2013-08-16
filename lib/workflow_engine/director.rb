module WorkflowEngine
  class Director

    attr_reader :flow

    def initialize(flow)
      @flow = flow
    end

    def execute
      @flow.each do |item|
        execute_item(item)
      end
    end

    def execute_item(item)
      cls = item[0].to_s.classify
      "WorkflowEngine::Actors::#{cls}".constantize.new(item[1])
    rescue
      raise "No actors found for #{item[0]}" << $!.to_s << item.inspect
    end
  end
end
