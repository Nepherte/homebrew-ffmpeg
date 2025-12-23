cask "ffmpeg" do
  arch arm: "arm64", intel: "amd64"

  on_arm do
    version "8.0,1756401489"
    sha256 "e7e0375f0b031ca0b013b7b7409500c3f6d10f1a0d4dc0c500774a304a60dc4f"

    depends_on arch: :arm64
  end
  on_intel do
    version "8.0.1,1766437297"
    sha256 "a6c41c69e829697e408308f1ecd6acdfd0d0a84973ff3a6bf782beba83885ed6"

    depends_on arch: :intel
  end

  url "https://ffmpeg.martin-riedl.de/download/macos/#{arch}/#{version.csv.second}_#{version.csv.first}/ffmpeg.zip",
      verified: "ffmpeg.martin-riedl.de/"
  name "ffmpeg"
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

  binary "ffmpeg"
end
