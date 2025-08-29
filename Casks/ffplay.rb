cask "ffplay" do
  arch arm: "arm64", intel: "amd64"

  on_arm do
    version "7.1.1,1741000090"
    sha256  "130783f3c40e8fda1e363993ea141c7645894783f1d619e2754ee415fed0e27c"

    depends_on arch: :arm64
  end
  on_intel do
    version "8.0,1756407576"
    sha256  "d6a1b8cd2ab48fb19de17c5745219ffb9dca2ccd624a568e04b87b7fac537b53"

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
