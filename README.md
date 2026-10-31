# pmaports-santos10wifi

postmarketOS packages for the Samsung Galaxy Tab 3 10.1 Wi-Fi (`samsung-santos10wifi`, GT-P5210).

The port was archived upstream (pmaports `device/archived/`), and its kernel source URL
(`github.com/dpdudek/android_kernel_samsung_santos10`) is now a 404. This repo keeps the packages
buildable:

- Copied from pmaports commit `cfbc1de3c` lineage (HEAD at 2026-10-31); the shared gcc patches that were
  symlinks upstream are real files here.
- Kernel source URL changed to [skelliam/android_kernel_samsung_santos10](https://github.com/skelliam/android_kernel_samsung_santos10)
  (fork of santos10-dev, branch `pmos-santos10`, pinned commit `edec7f67`). The tarball sha512 is unchanged.

## Use

Copy `device/archived/*-samsung-santos10wifi` into your pmaports checkout (e.g.
`~/.local/var/pmbootstrap/cache_git/pmaports/device/archived/`), run `pmbootstrap init` and type
`samsung` / `santos10wifi`.

Status on hardware: see the [postmarketOS wiki page](https://wiki.postmarketos.org/wiki/Samsung_Galaxy_Tab_3_10.1_Wi-Fi_(samsung-santos10wifi)).
Touchscreen and Wi-Fi work, 3D acceleration does not, only Xfce4 tested.
