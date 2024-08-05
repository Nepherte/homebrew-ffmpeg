cask "ffprobe" do
  version "7.0.2"
  sha256 "0371f375130a61acb5a34c49cbcd47e02d304c7e869b7cb25eace7c57def75f4"

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
