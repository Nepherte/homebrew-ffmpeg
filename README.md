Homebrew tap containing static FFmpeg binaries for macOS.

Installation
------------
To install a package contained in this homebrew tap, run the commands:

    brew tap nepherte/ffmpeg
    brew install --cask nepherte/ffmpeg/<package>

Packages
--------
An overview of the available packages in this homebrew tap:

| Package |       x86_64       |       arm64        | Remarks |
|:--------|:------------------:|:------------------:|:-------:|
| ffmpeg  | :white_check_mark: | :white_check_mark: |    -    |
| ffplay  | :white_check_mark: | :white_check_mark: |    -    |
| ffprobe | :white_check_mark: | :white_check_mark: |    -    |

FAQ
---
#### Where are the binaries coming from?
The binaries are taken from https://ffmpeg.martin-riedl.de.

#### What options are used to compile the binaries?
This is extensively documented at https://ffmpeg.martin-riedl.de.

Credits
-------
Big thanks to Martin Riedl for providing the builds. Check out his website
at https://www.martin-riedl.de.