cask "ffprobe" do
  version "9.1,1795207104"
  sha256 "6ef2df5f575042923a28537ab37adf936f28bf3e7b85de23a1447ed447ec1dbd"

  url "https://ffmpeg.martin-riedl.de/download/macos/arm64/#{version.csv.second}_#{version.csv.first}/ffprobe.zip"
  name "ffprobe"
  desc "Complete, cross-platform solution to convert audio and video"
  homepage "https://ffmpeg.org/"

  livecheck do
    url "https://ffmpeg.martin-riedl.de/info/history/macos/arm64/release"
    regex(%r{href=".*/(\d+)_(\d+(?:\.\d+){1,2})"}i)
    strategy :page_match do |page, regex|
      match = page.match(regex)
      next if match.blank?

      "#{match[2]},#{match[1]}"
    end
  end

  depends_on arch: :arm64
  depends_on :macos

  binary "ffprobe"
end
