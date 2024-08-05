cask "ffplay" do
  version "7.0.2"
  sha256 "67c2eb7fd8fda1e9bca6030f90353cfe8f3aa5de35f1967f534ecb85c4e6eb4d"

  url "https://evermeet.cx/pub/ffplay/ffplay-#{version}.zip", verified: "evermeet.cx/"
  name "ffplay"
  desc "Complete, cross-patform solution to convert audio and video"
  homepage "https://ffmpeg.org/"

  livecheck do
    url "https://evermeet.cx/pub/ffplay/"
    regex(/href=.*?ffplay[._-](\d+\.\d+(?:\.\d+)?)\.zip/i)
  end

  depends_on macos: ">= :big_sur"

  binary "ffplay"

  caveats <<~EOS
    On macOS 10.15 (Catalina) and later, the binary has to be removed from quarantine:

      xattr -dr com.apple.quarantine #{staged_path}/#{token}
  EOS
end
