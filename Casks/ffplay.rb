cask "ffplay" do
  version "7.0.1"
  sha256 "19995d51c07d9048e1472f91ce0d33f29bee3280745385d20d4f69fe08128b75"

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
