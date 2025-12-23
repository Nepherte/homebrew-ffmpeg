cask "ffprobe" do
  arch arm: "arm64", intel: "amd64"

  on_arm do
    version "8.0,1756401489"
    sha256 "f564c9a4e6514ee0b159e70fcd042b45493c3b47603b72a2ddbf7ee4fe9bfca1"

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
