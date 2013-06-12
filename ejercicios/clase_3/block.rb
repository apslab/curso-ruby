class Document

  attr_accessor :content
  
  def initialize(content = nil)
    @content = ''
    yield(self) if block_given?
  end
end
