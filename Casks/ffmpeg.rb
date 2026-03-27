cask "ffmpeg" do
  arch arm: "arm64", intel: "amd64"

  on_arm do
    version "8.0.1,1766430132"
    sha256 "c56f4e2b2ce26a61becf890d8da3415347a1d7d4418cb514915f21612358b790"

    depends_on arch: :arm64
  end
  on_intel do
    version "8.1,1774556648"
    sha256 "eaa8aa619f8eccc7f548a730097f5d299cbf2d418888421c137557344d821130"

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
