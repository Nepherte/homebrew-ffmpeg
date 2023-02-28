cask "ffmpeg" do
  name "ffmpeg"
  version "5.1.2"

  homepage "https://ffmpeg.org/"
  desc "A complete, cross-patform solution to convert audio and video"

  url "https://evermeet.cx/pub/ffmpeg/ffmpeg-#{version}.zip", verified: "https://evermeet.cx"
  sha256 "66e95e01b30ae425838686235da97f27943824bd1299b1dedd997902ed587adf"

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
