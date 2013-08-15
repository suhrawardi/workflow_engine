module WorkflowEngine
  module Parser
    class Main
       
      # Load the Treetop grammar from the 'workflow_parser' file, and 
      # create a new instance of that parser as a class variable 
      # so we don't have to re-create it every time we need to 
      # parse a string

      Treetop.load(File.expand_path('workflow.treetop', File.dirname(__FILE__)))
      @@parser = WorkflowParser.new

      def self.parse(data)
        tree = @@parser.parse(data)
        if (tree.nil?)
          raise Exception, "Parse error at offset: #{@@parser.index}"
        end
        tree
      end

      def initialize(data)
        @tree = self.class.parse(data)
      end

      def clean_tree
        self.class.clean_tree(@tree)
        @tree
      end

      def to_array
        clean_tree.to_array
      end

    private

      def self.clean_tree(root_node)
        return if (root_node.elements.nil?)
        root_node.elements.delete_if { |node|
          node.class.name == "Treetop::Runtime::SyntaxNode"
        }
        root_node.elements.each { |node| self.clean_tree(node) }
      end
    end
  end
end
