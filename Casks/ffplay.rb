cask "ffplay" do
  version "9.0.1,1787073674"
  sha256 "7063e79c64c2bf7f0fb61a7a9fb657af87f123f4b63b978a99628f0ebc97ebdf"

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
