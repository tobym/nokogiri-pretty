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
end
