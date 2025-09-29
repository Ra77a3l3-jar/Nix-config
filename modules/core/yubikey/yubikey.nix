{pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    yubikey-manager       # CLI tool to manage YubiKey (ykman)
    libfido2             # Core library for FIDO2/WebAuthn
    pcsclite             # Smartcard daemon (needed for PIV/OTP/smartcard features)
    pcsc-tools           # Optional tools to debug smartcard detection
    gnome-keyring   # GNOME keyring service (should be already there in GNOME)
    gcr                  # Needed for GNOME password/keyring dialogs
  ];

  services.pcscd.enable = true;          # Smartcard daemon (pcscd)
  services.udev.packages = [ pkgs.yubikey-personalization ];  # Udev rules for YubiKey
  
}
