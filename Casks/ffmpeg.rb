cask "ffmpeg" do
  name "ffmpeg"
  version "6.0.1"

  homepage "https://ffmpeg.org/"
  desc "A complete, cross-patform solution to convert audio and video"

  url "https://evermeet.cx/pub/ffmpeg/ffmpeg-#{version}.zip", verified: "https://evermeet.cx"
  sha256 "1b5bdb6be9f9601b6951672f99a18cb89c0d6e59ccc1453314f94b4d0579271b"

  binary "ffmpeg"
  depends_on macos: ">= :big_sur"

  livecheck do
    url "https://evermeet.cx/pub/ffmpeg/"
    regex(/href=.*?ffmpeg[._-](\d+\.\d+(?:\.\d+)?)\.zip/i)
  end

  caveats <<~EOS
    On macOS 10.15 (Catalina) and later, the binary has to be removed from quarantine:

      xattr -dr com.apple.quarantine #{staged_path}/#{token}
  EOS
end
