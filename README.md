Homebrew tap containing static FFmpeg binaries for macOS.

Installation
------------
To install a package contained in this homebrew tap, run the commands:

    brew tap nepherte/ffmpeg
    brew install --cask <package>

Packages
--------
An overview of the available packages in this homebrew tap:

| Package |  Version  |       x86_64       |       arm64        | Remarks   |
|:--------|:---------:|:------------------:|:------------------:|:----------|
| ffmpeg  |  7.0.2    | :white_check_mark: |     :warning:      | rosetta 2 |
| ffplay  |  7.0.2    | :white_check_mark: |     :warning:      | rosetta 2 |
| ffprobe |  7.1.     | :white_check_mark: |     :warning:      | rosetta 2 |

FAQ
---
#### Where are the binaries coming from?
The binaries are taken from https://evermeet.cx/ffmpeg/.

#### What options are used to compile the binaries?
This is extensively documented at https://evermeet.cx/ffmpeg/.

#### Can you provide a build / cask for Apple Silicon?
There is currently no plan to do so. More info at https://evermeet.cx/ffmpeg/apple-silicon-arm.

Credits
-------
Big thanks to Helmut Tessarek for providing the builds. Check out his website
at https://evermeet.cx/.
