cask "ffprobe" do
  name "ffprobe"
  version "6.0.1"

  homepage "https://ffmpeg.org/"
  desc "A complete, cross-patform solution to convert audio and video"

  url "https://evermeet.cx/pub/ffprobe/ffprobe-#{version}.zip", verified: "https://evermeet.cx"
  sha256 "2ebd44315e41f9c4acbc49bca98861f28efb911af4e4775048dc4f7ec8f4ef04"

  binary "ffprobe"
  depends_on macos: ">= :big_sur"

  livecheck do
    url "https://evermeet.cx/pub/ffprobe/"
    regex(/href=.*?ffprobe[._-](\d+\.\d+(?:\.\d+)?)\.zip/i)
  end

  caveats <<~EOS
    On macOS 10.15 (Catalina) and later, the binary has to be removed from quarantine:

      xattr -dr com.apple.quarantine #{staged_path}/#{token}
  EOS
end
