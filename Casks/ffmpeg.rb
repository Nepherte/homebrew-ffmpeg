cask "ffmpeg" do
  name "ffmpeg"
  version "6.0"

  homepage "https://ffmpeg.org/"
  desc "A complete, cross-patform solution to convert audio and video"

  url "https://evermeet.cx/pub/ffmpeg/ffmpeg-#{version}.zip", verified: "https://evermeet.cx"
  sha256 "9a810d222862a7230fd7035c91e32beb605af7501c3517580f2bc1eb8faddacc"

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
