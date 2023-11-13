cask "ffplay" do
  version "6.1"
  sha256 "3b71ca5e45607b2d686a7a7f6e01d1a1f094e0abb2a706cacf000971da9c58d6"

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
