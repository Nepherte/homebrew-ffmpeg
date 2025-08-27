cask "ffprobe" do
  arch arm: "arm64", intel: "amd64"

  name "ffprobe"
  homepage "https://ffmpeg.org/"
  desc "Complete, cross-platform solution to convert audio and video"

  on_arm do
    version "7.1.1,1741000090"
    sha256 "4eeb4644703bed221eec72107fbe2cc1e1180a3605c53136866cf43886d0499a"
  end

  on_intel do
    version "7.1.1,1741001873"
    sha256 "bfea765749e422cd4b3512f2e0528592611d4ddfe47b128bf88453322f9050b5"
  end

  url "https://ffmpeg.martin-riedl.de/download/macos/#{arch}/#{version.csv.second}_#{version.csv.first}/ffprobe.zip",
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

  binary "ffprobe"
end