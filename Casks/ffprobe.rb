cask "ffprobe" do
  name "ffprobe"
  version "6.0"

  homepage "https://ffmpeg.org/"
  desc "A complete, cross-patform solution to convert audio and video"

  url "https://evermeet.cx/pub/ffprobe/ffprobe-#{version}.zip", verified: "https://evermeet.cx"
  sha256 "aefcbe2c89f26d3ed6daaa2bb07c9a0e0b6c59b0967ecc4e1cb35a132d6b9926"

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
