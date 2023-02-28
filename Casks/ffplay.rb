cask "ffplay" do
  name "ffplay"
  version "6.0"

  homepage "https://ffmpeg.org/"
  desc "A complete, cross-patform solution to convert audio and video"

  url "https://evermeet.cx/pub/ffplay/ffplay-#{version}.zip", verified: "https://evermeet.cx"
  sha256 "ca1049a493640394b197c5f7c94338bd24b9efb11ce1e3ced329deb07ac2af93"

  binary "ffplay"
  depends_on macos: ">= :big_sur"

  livecheck do
    url "https://evermeet.cx/pub/ffplay/"
    regex(/href=.*?ffplay[._-](\d+\.\d+(?:\.\d+)?)\.zip/i)
  end

  caveats <<~EOS
    On macOS 10.15 (Catalina) and later, the binary has to be removed from quarantine:

      xattr -dr com.apple.quarantine #{staged_path}/#{token}
  EOS
end
