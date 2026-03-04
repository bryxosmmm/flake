{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "mmdr";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "1jehuang";
    repo = "mermaid-rs-renderer";
    rev = "v${version}";
    hash = "sha256-g2SIz9ccq1SClbiHDM/vVbwvncCp0eGCm49yvjttmrY=";
  };

  cargoHash = "sha256-pZRIpkTBfPQ5asgSzHJBlLsHLMh6uZ0jMRd8sX9gFL8=";

  meta = with lib; {
    description = "CLI tool to convert Mermaid diagrams to images and PDFs";
    homepage = "https://github.com/1jehuang/mermaid-rs-renderer";
    license = licenses.mit;
    platforms = platforms.unix;
    mainProgram = "mmdr";
  };
}
