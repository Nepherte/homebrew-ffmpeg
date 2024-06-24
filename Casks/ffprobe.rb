cask "ffprobe" do
  version "7.0.1"
  sha256 "c36939533ce717ff9c32202fc96a0f74ba16ee13defe54b5de8bb16c443c4dff"

  url "https://evermeet.cx/pub/ffprobe/ffprobe-#{version}.zip", verified: "evermeet.cx/"
  name "ffprobe"
  desc "Complete, cross-patform solution to convert audio and video"
  homepage "https://ffmpeg.org/"

  livecheck do
    url "https://evermeet.cx/pub/ffprobe/"
    regex(/href=.*?ffprobe[._-](\d+\.\d+(?:\.\d+)?)\.zip/i)
  end

  depends_on macos: ">= :big_sur"

  binary "ffprobe"

  caveats <<~EOS
    On macOS 10.15 (Catalina) and later, the binary has to be removed from quarantine:

      xattr -dr com.apple.quarantine #{staged_path}/#{token}
  EOS
end
