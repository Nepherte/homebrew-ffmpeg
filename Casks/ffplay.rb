cask "ffplay" do
  version "7.1.1"
  sha256 "31b9442bf640ef2e2294edcd4d8d82a1505218f75bbd99d0c90fcd2eeefffe13"

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
