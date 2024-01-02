cask "ffprobe" do
  version "6.1.1"
  sha256 "8644a01fd59afe1c9442a102372cacd2db73807aa05f7e33bcf06aa6e58a4771"

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
