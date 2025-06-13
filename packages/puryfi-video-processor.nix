{ lib
, stdenv
, fetchurl
, bash
, makeWrapper
, ffmpeg
, tensorflow
}:

stdenv.mkDerivation rec {
  pname = "puryfi-video-processor";
  version = "1.1.0.3";

  src = fetchurl {
    url = "https://github.com/pury-fi/PuryFi-Video-Processor-Releases/releases/download/v${version}/puryfi-video-processor-linux64.tar.gz";
    sha256 = "0000000000000000000000000000000000000000000000000000"; # Replace with actual hash
  };

  nativeBuildInputs = [
    makeWrapper
  ];

  buildInputs = [
    ffmpeg
    tensorflow
    bash
  ];

  unpackPhase = ''
    runHook preUnpack
    tar -xzf $src
    runHook postUnpack
  '';

  buildPhase = ''
    runHook preBuild

    mkdir -p vendor/tfjs/deps/lib vendor/ffmpeg/bin

    # Link system TensorFlow libraries
    ln -s ${tensorflow}/lib/libtensorflow*.so* vendor/tfjs/deps/lib/ 2>/dev/null || true

    # Link system FFmpeg binaries
    ln -s ${ffmpeg}/bin/ffmpeg vendor/ffmpeg/bin/ffmpeg
    ln -s ${ffmpeg}/bin/ffprobe vendor/ffmpeg/bin/ffprobe

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/puryfi-video-processor
    cp -r . $out/share/puryfi-video-processor/

    chmod +x $out/share/puryfi-video-processor/scripts/start.sh

    # Create a wrapper script for easy manifest installation
    mkdir -p $out/bin
    cat > $out/bin/puryfi-install-manifest << EOF
#!/usr/bin/env bash
MOZILLA_DIR="\$HOME/.mozilla"
MANIFEST_FILE_PATH="\$MOZILLA_DIR/native-messaging-hosts/puryfi.video_processor.json"
mkdir -p "\$(dirname "\$MANIFEST_FILE_PATH")"
cat > "\$MANIFEST_FILE_PATH" << 'INNER_EOF'
{
   "name": "puryfi.video_processor",
   "description": "PuryFi's Video Processor",
   "path": "$out/share/puryfi-video-processor/scripts/start.sh",
   "type": "stdio",
   "allowed_extensions": [
      "puryfi@pury.fi",
      "pury.fi@pury.fi"
   ]
}
INNER_EOF
echo "Native messaging manifest installed to \$MANIFEST_FILE_PATH"
echo "Restart Firefox to use the extension."
EOF
    chmod +x $out/bin/puryfi-install-manifest

    runHook postInstall
  '';

  postFixup = ''
    # No additional fixups needed
  '';

  meta = with lib; {
    description = "PuryFi's Video Processor - Native messaging host for Firefox";
    homepage = "https://github.com/pury-fi/PuryFi-Video-Processor-Releases";
    license = licenses.unfree;
    platforms = platforms.linux;
    maintainers = [ ];
  };
}
