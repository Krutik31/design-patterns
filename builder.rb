# Let's say we want to build a convertor, which convert different file formats into text format.
# It reads data from images, pdf, excel, etc.

# In such converter, we have to write different logic for different formats.
# Builder patterns states that instead writing entire logic in a single class and make things out of the control, we should create as many classes as we can and create builder class at last to bind them together.

class Parser
  def initialize(ext)
    @ext = ext
  end
end

class PdfReader < Parser
  def convert
    # Logic for converting pdf
  end
end

class ImageReader < Parser
  def convert
    # Logic for converting pdf
  end
end

class ParserBuilder
  def self.build(ext)
    PdfReader.new(ext) if ext == 'pdf'
    ImageReader.new(ext) if ext == 'jpeg'
  end
end

data = ParserBuilder.build('pdf')
data.convert
