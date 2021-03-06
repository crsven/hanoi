class Webkit < Browser
  def initialize(path = File.join(ENV['WEBKIT_HOME'] || ENV['ProgramFiles'] || 'C:\Program Files', 'Webkit', 'webkit.exe'))
    @path = path
  end

  def supported?
    macos? || windows?
  end

  def setup
    applescript(%(tell application "#{name}" to make new document)) if macos?
  end

  def visit(url)
    if macos?
      applescript(%(tell application "#{name}" to set URL of front document to "#{url}"))
    elsif windows?
      system("#{path} #{url}")
    end
  end

  def teardown
    #applescript('tell application "Safari" to close front document')

    if macos?
      system("killall #{escaped_name}")
    end
  end

  private
    def applescript(script)
      raise "Can't run AppleScript on #{host}" unless macos?
      system "osascript -e '#{script}' 2>&1 >/dev/null"
    end
end
