cask "ffmpeg" do
  arch arm: "arm64", intel: "amd64"

  on_arm do
    version "7.1.1,1741000090"
    sha256 "e18c39a330ad783c33d6d7b47784e82a42f8acdbb497a1f73550f1bc0e830d44"

    depends_on arch: :arm64
  end
  on_intel do
    version "8.0,1756407576"
    sha256 "1cf942791d5524cc5e090ba6ecff7d2b03ffc916bddece9618a5f6d91afdb0df"

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
