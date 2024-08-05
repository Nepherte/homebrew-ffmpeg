cask "ffmpeg" do
  version "7.0.2"
  sha256 "502622443f3fc412d101e682518dbeb1debbf73f54c94e7704a4448d6b7bc1f7"

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
