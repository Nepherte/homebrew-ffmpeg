cask "ffplay" do
  arch arm: "arm64", intel: "amd64"

  name "ffplay"
  homepage "https://ffmpeg.org/"
  desc "Complete, cross-platform solution to convert audio and video"

  on_arm do
    version "7.1.1,1741000090"
    sha256  "130783f3c40e8fda1e363993ea141c7645894783f1d619e2754ee415fed0e27c"
  end

  on_intel do
    version "7.1.1,1741001873"
    sha256  "ca14a3d3e41476ceb664cc6025b3cf101ce3a479d6bbcd3ae0514a399833dbd1"
  end

  url "https://ffmpeg.martin-riedl.de/download/macos/#{arch}/#{version.csv.second}_#{version.csv.first}/ffplay.zip",
      verified: "https://ffmpeg.martin-riedl.de"

  livecheck do
    url "https://ffmpeg.martin-riedl.de/info/history/macos/#{arch}/release"
    regex(/href=\".*\/(\d+)_(\d+(?:\.\d+){1,2})\"/i)
    strategy :page_match do |page, regex|
      match = page.match(regex)
      next if match.blank?
      "#{match[2]},#{match[1]}"
    end
  end

  binary "ffplay"
end