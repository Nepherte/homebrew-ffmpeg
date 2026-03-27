cask "ffplay" do
  arch arm: "arm64", intel: "amd64"

  on_arm do
    version "8.1,1774549676"
    sha256  "1b085769ef877519d82bf5d32fb44162831fa8fcdc72f06f55adac5529bfa69a"

    depends_on arch: :arm64
  end
  on_intel do
    version "8.1,1774556648"
    sha256  "169ac70f3c85558c0f11fa25465ca0cb785f50e9c41532a4bb0cb1158c53a3de"

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
