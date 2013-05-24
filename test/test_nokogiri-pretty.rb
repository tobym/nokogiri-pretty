require 'helper'

class TestNokogiriPretty < Test::Unit::TestCase
  should "print XML documents for humans" do
    doc = Nokogiri::XML('<foo>bar</foo>')
    assert doc.respond_to? :human
  end

  should "print HTML documents for humans" do
    doc = Nokogiri::HTML('<div>bar</div>')
    assert doc.respond_to? :human
  end

  context "custom xslt" do
    setup do
      @doc = Nokogiri::XML('<foo>bar</foo>')
      @sample_stylesheet = '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"></xsl:stylesheet>'
    end

    should "accept an optional XSLT to use" do
      Nokogiri.expects(:XSLT).with(@sample_stylesheet).returns(stub(:apply_to))
      @doc.human(:xslt => @sample_stylesheet)
    end

    should "work without specifying a custom XSLT" do
      Nokogiri.expects(:XSLT).returns(stub(:apply_to))
      @doc.human
    end
  end
end
