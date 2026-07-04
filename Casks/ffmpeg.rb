cask "ffmpeg" do
  version "8.1.2,1783011502"
  sha256 "ef1aa60006c7b77ce170c1608c08d8e4ba1c30c5746f2ac986ded932d0ac2c3c"

  url "https://ffmpeg.martin-riedl.de/download/macos/arm64/#{version.csv.second}_#{version.csv.first}/ffmpeg.zip",
      verified: "ffmpeg.martin-riedl.de/"
  name "ffmpeg"
  desc "Complete, cross-platform solution to convert audio and video"
  homepage "https://ffmpeg.org/"

  depends_on :macos
  depends_on arch: :arm64

  livecheck do
    url "https://ffmpeg.martin-riedl.de/info/history/macos/arm64/release"
    regex(%r{href=".*/(\d+)_(\d+(?:\.\d+){1,2})"}i)
    strategy :page_match do |page, regex|
      match = page.match(regex)
      next if match.blank?

      "#{match[2]},#{match[1]}"
    end
  end

  binary "ffmpeg"
end
