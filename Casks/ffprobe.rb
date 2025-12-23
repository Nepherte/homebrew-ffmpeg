cask "ffprobe" do
  arch arm: "arm64", intel: "amd64"

  on_arm do
    version "8.0.1,1766430132"
    sha256 "ad74fb26500f9a67864611856a655636d910b47a21c9ee2f2f7bc7cbaa45bbb2"

    depends_on arch: :arm64
  end
  on_intel do
    version "8.0,1756407576"
    sha256 "32a1989f2c9b06254d919df0465ae414a4eb7f525fbb02d1add24818cad4d7b4"

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
