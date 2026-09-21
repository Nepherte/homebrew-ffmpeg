cask "ffprobe" do
  version "9.0.2,1789931890"
  sha256 "fcbe839537485eaee7a7a8bc5cbc0f90d53617e80943e8a5b2e31cb851197ea6"

  url "https://ffmpeg.martin-riedl.de/download/macos/arm64/#{version.csv.second}_#{version.csv.first}/ffprobe.zip"
  name "ffprobe"
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

  binary "ffprobe"
end
