cask "ffprobe" do
  arch arm: "arm64", intel: "amd64"

  on_arm do
    version "8.1.1,1778761665"
    sha256 "135e70d2518beeb568183952dbc4bdeca1628dd49a7376d57e6b27dbc57d209f"

    depends_on arch: :arm64
  end
  on_intel do
    version "8.1.1,1778768838"
    sha256 "e9b9b83fef584c367b27c683a1172921b4f48fa8bd5df6712ef54e63b915ea50"

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
