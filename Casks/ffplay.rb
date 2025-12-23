cask "ffplay" do
  arch arm: "arm64", intel: "amd64"

  on_arm do
    version "8.0,1756401489"
    sha256  "462f7e90da916b529914be20fccd447097df9820025a689a9b1355eb68d25220"

    depends_on arch: :arm64
  end
  on_intel do
    version "8.0.1,1766437297"
    sha256  "eb28e2022609eb3922945693ce0596abdc5d6fabe69f07c2c4f6265cdfd2a92a"

    depends_on arch: :intel
  end

  url "https://ffmpeg.martin-riedl.de/download/macos/#{arch}/#{version.csv.second}_#{version.csv.first}/ffplay.zip",
      verified: "ffmpeg.martin-riedl.de/"
  name "ffplay"
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

  binary "ffplay"
end
