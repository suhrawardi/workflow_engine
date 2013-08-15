module Workflow
  class Step < Treetop::Runtime::SyntaxNode
    def to_array
      [:step, self.text_value.gsub(/^step\s+/, '')]
    end
  end

  class If < Treetop::Runtime::SyntaxNode
    def to_array
      [:if, self.elements.map {|x| x.to_array}]
    end
  end

  class Concurrent < Treetop::Runtime::SyntaxNode
    def to_array
      [:concurrent, self.elements[0].elements.map {|x| x.to_array}]
    end
  end

  class Expression < Treetop::Runtime::SyntaxNode
    def to_array
      [:expression, self.text_value.match(/\[(.*)\]/)[1]]
    end
  end

  class Document < Treetop::Runtime::SyntaxNode
    def to_array
      self.elements.map {|x| x.to_array}
    end
  end
end
