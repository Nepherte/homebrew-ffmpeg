cask "ffmpeg" do
  arch arm: "arm64", intel: "amd64"

  on_arm do
    version "8.1,1774549676"
    sha256 "cc3a7e0cce36c5eca6c17eeb93830984c657637a8e710dc98f19c8051201fa3a"

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
