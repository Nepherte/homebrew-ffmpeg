cask "ffprobe" do
  version "6.1"
  sha256 "e292a8e401aa6a87bdb32feab8eef913f69320a14126ce667ea09964a40e20a4"

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
