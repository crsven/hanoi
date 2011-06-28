class Phantom < Browser
  def initialize(path = nil)
    @path = "phantomjs"
  end

  def supported?
    macos?
  end

  def installed?
    system("which phantomjs")
  end

  def name
    "Phantom JS"
  end

  def path
    "phantomjs"
  end

  def visit(url)
    system("#{path} test/javascript/assets/run-qunit.js '#{url}'")
  end
end
