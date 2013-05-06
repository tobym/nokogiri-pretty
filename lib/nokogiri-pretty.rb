require 'nokogiri'

module NokogiriPretty
  def human(options = {})
    Formatter.new(options).apply_to self
  end

  class Formatter
    def initialize(options = {})
      @stylesheet = options[:xslt] || indentation_xslt
    end

    def apply_to(xml_node)
      xsl = Nokogiri::XSLT(@stylesheet)
      xsl.apply_to xml_node
    end

    private

    def indentation_xslt
      File.read(File.join(File.dirname(__FILE__), 'indent.xsl'))
    end
  end
end

class Nokogiri::XML::Node
  include NokogiriPretty
end
