cask "ffmpeg" do
  version "6.1.1"
  sha256 "7de74c26a20dd172ed49c7de6035ee0790c83e69e461c3a6895b33ae0787e513"

  url "https://evermeet.cx/pub/ffmpeg/ffmpeg-#{version}.zip", verified: "evermeet.cx/"
  name "ffmpeg"
  desc "Complete, cross-patform solution to convert audio and video"
  homepage "https://ffmpeg.org/"

  livecheck do
    url "https://evermeet.cx/pub/ffmpeg/"
    regex(/href=.*?ffmpeg[._-](\d+\.\d+(?:\.\d+)?)\.zip/i)
  end

  depends_on macos: ">= :big_sur"

  binary "ffmpeg"

  caveats <<~EOS
    On macOS 10.15 (Catalina) and later, the binary has to be removed from quarantine:

      xattr -dr com.apple.quarantine #{staged_path}/#{token}
  EOS
end
