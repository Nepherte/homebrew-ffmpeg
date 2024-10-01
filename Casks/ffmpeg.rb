cask "ffmpeg" do
  version "7.1"
  sha256 "5a1303c7babaffff3c32c141ff49c7f44bd3b3b3e7dcea992fd7d04b6558ef43"

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
