# AP8220 DAED addition for Scripts/Packages.sh
#
# Add the following block immediately AFTER:
#
# UPDATE_PACKAGE "nikki" "nikkinikki-org/OpenWrt-nikki" "main"
#
# and BEFORE:
#
# UPDATE_PACKAGE "openclash" "vernesong/OpenClash" "dev" "pkg"
#
# ----------------------------------------------------------------

# DAED: clone complete upstream tree.
# Repository contains the daed backend and luci-app-daed frontend.
#
# IMPORTANT:
# Packages.sh is executed from ./wrt/package/ by WRT-CORE.yml,
# so cloning here places the package tree under OpenWrt's package directory.

rm -rf luci-app-daed daed

# Remove possible duplicates from standard feeds to prevent package collisions.
find ../feeds/luci ../feeds/packages \
  -maxdepth 4 \
  -type d \
  \( -name 'daed' -o -name 'luci-app-daed' \) \
  -print -exec rm -rf {} + 2>/dev/null || true

git clone \
  --depth=1 \
  --single-branch \
  --branch kix \
  https://github.com/QiuSimons/luci-app-daed.git \
  luci-app-daed

echo "DAED source tree installed:"
find ./luci-app-daed -maxdepth 3 -name Makefile -print
