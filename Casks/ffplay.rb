cask "ffplay" do
  version "7.1"
  sha256 "c0c753a5295661bc7d51cad4f13551a1f754cad9103b8e074e521a8a527704c3"

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
