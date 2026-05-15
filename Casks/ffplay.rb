cask "ffplay" do
  arch arm: "arm64", intel: "amd64"

  on_arm do
    version "8.1.1,1778761665"
    sha256  "cab564e07ff6e7921f5560c63ccc95f4b876722ff07aa86cbdad1bb78d274d38"

    depends_on arch: :arm64
  end
  on_intel do
    version "8.1.1,1778768838"
    sha256  "1f0a2944a7c55f59004259d6a5540bb31cc6f734cb4fa1f6833f743773c4f890"

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
