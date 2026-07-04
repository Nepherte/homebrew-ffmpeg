cask "ffplay" do
  version "8.1.2,1783011502"
  sha256 "85dbdb78234d01ffcec7a20b6f5eb5e156cef38b7992d47551f16153db724523"

  url "https://ffmpeg.martin-riedl.de/download/macos/arm64/#{version.csv.second}_#{version.csv.first}/ffplay.zip",
      verified: "ffmpeg.martin-riedl.de/"
  name "ffplay"
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

  binary "ffplay"
end
