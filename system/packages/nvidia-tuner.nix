{
  lib,
  rustPlatform,
  fetchFromGitHub,
  addDriverRunpath,
}:

rustPlatform.buildRustPackage rec {
  pname = "nvidia-tuner";
  version = "0.6.0";

  src = fetchFromGitHub {
    owner = "WickedLukas";
    repo = "nvidia-tuner";
    rev = version;
    hash = "sha256-hpe1QI8eNr3gm0HObFD8dng3OuBQ6qHjZPrEoG81Vi4=";
  };

  cargoHash = "sha256-s918YUdohW80ATge3pZSa0fDz5rSM1w9xnEyEqHsfwg=";

  nativeBuildInputs = [ addDriverRunpath ];

  # NVML is loaded at runtime via dlopen (nvml-wrapper-sys uses libloading),
  # so the driver's libnvidia-ml.so.1 needs to be on the runpath.
  postFixup = ''
    addDriverRunpath $out/bin/nvidia-tuner
  '';

  meta = {
    description = "CLI tool for overclocking, undervolting and fan control of NVIDIA GPUs on Linux";
    homepage = "https://github.com/WickedLukas/nvidia-tuner";
    license = lib.licenses.mit;
    mainProgram = "nvidia-tuner";
    platforms = lib.platforms.linux;
  };
}
