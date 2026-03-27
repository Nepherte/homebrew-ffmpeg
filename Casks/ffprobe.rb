cask "ffprobe" do
  arch arm: "arm64", intel: "amd64"

  on_arm do
    version "8.1,1774549676"
    sha256 "fd2e6b7fad9c9aa2bec17c0d7211b5afcc00b4b5c9b63c120985e80c3c198af6"

    depends_on arch: :arm64
  end
  on_intel do
    version "8.0.1,1766437297"
    sha256 "a09b01e8f54ccdbeb661d48952f412edb858860b38ec7fd1c3901a645e3a3b04"

    depends_on arch: :intel
  end

  url "https://ffmpeg.martin-riedl.de/download/macos/#{arch}/#{version.csv.second}_#{version.csv.first}/ffprobe.zip",
      verified: "ffmpeg.martin-riedl.de/"
  name "ffprobe"
  desc "Complete, cross-platform solution to convert audio and video"
  homepage "https://ffmpeg.org/"

  livecheck do
    url "https://ffmpeg.martin-riedl.de/info/history/macos/#{arch}/release"
    regex(%r{href=".*/(\d+)_(\d+(?:\.\d+){1,2})"}i)
    strategy :page_match do |page, regex|
      match = page.match(regex)
      next if match.blank?

      "#{match[2]},#{match[1]}"
    end
  end

  binary "ffprobe"
end
