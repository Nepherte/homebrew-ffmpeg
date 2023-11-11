cask "ffplay" do
  name "ffplay"
  version "6.0.1"

  homepage "https://ffmpeg.org/"
  desc "A complete, cross-patform solution to convert audio and video"

  url "https://evermeet.cx/pub/ffplay/ffplay-#{version}.zip", verified: "https://evermeet.cx"
  sha256 "9da068a89ab2be4104e51119f2e604567230b27101501815ef1d0add50752015"

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
