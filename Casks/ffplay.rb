cask "ffplay" do
  name "ffplay"
  version "5.1.2"

  homepage "https://ffmpeg.org/"
  desc "A complete, cross-patform solution to convert audio and video"

  url "https://evermeet.cx/pub/ffplay/ffplay-#{version}.zip", verified: "https://evermeet.cx"
  sha256 "4864ab3705a2c60ba2b0bf7de36d7b796b6f78b588e0d361cafec609b433083e"

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
