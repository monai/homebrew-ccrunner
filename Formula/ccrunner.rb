class Ccrunner < Formula
  desc "Closure Compiler web runner"
  homepage "https://github.com/monai/cc-web-runner"
  url "https://github.com/monai/cc-web-runner/releases/download/v1.0.8/cc-web-runner-standalone-1.0.8.jar"
  version "1.0.8"
  sha256 "d5e55d612a399d931ea247c7ccdb71a1ffa49e427d251581578f6319907a8f9b"

  depends_on :java => "1.8"

  def install
    libexec.install "cc-web-runner-standalone-#{version}.jar"
  end

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>/usr/bin/java</string>
        <string>-jar</string>
        <string>/usr/local/Cellar/ccrunner/#{version}/libexec/cc-web-runner-standalone-#{version}.jar</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>StandardErrorPath</key>
      <string>#{var}/log/ccrunner.log</string>
      <key>StandardOutPath</key>
      <string>#{var}/log/ccrunner.log</string>
      </dict>
    </plist>
    EOS
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test CCRunner`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
