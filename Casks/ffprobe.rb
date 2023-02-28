cask "ffprobe" do
  name "ffprobe"
  version "5.1.2"

  homepage "https://ffmpeg.org/"
  desc "A complete, cross-patform solution to convert audio and video"

  url "https://evermeet.cx/pub/ffprobe/ffprobe-#{version}.zip", verified: "https://evermeet.cx"
  sha256 "ba680ebbd3002bfab1251409db19fae462aa34c55bf07bbb21437cfdc655585c"

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
