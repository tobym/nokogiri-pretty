require 'nokogiri'

module NokogiriPretty
  template = File.join(File.dirname(__FILE__), 'indent.xsl')
  XSL = Nokogiri::XSLT(File.open(template))

  def human
    XSL.apply_to self
  end
end


class Nokogiri::XML::Node
  include NokogiriPretty
end
