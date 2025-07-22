#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.88.1/g' package/base-files/files/bin/config_generate
# Modify X86 Kernel
#sed -i 's/KERNEL_PATCHVER:=6.6/KERNEL_PATCHVER:=5.4/g' target/linux/x86/Makefile
# Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings
# Modify frpc default setting
#sed -i 's/yourdomain.com/frp.104300.xyz/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#sed -i 's/1234567/www.126126.xyz/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#固件版本号添加个人标识和日期
sed -i "s/DISTRIB_DESCRIPTION='LEDE '/DISTRIB_DESCRIPTION='Mitsuki($(TZ=UTC-8 date +%Y.%m.%d)) '/g" package/lean/default-settings/files/zzz-default-settings

sed -i 's/1.8.0.0/1.8.0.2/g' feeds/packages/net/socat/Makefile
sed -i 's/e1de683dd22ee0e3a6c6bbff269abe18ab0c9d7eb650204f125155b9005faca7/adc07a9c2723527cf6568d2fb96559794cf9c254a4bc2edd36f7f3789e9f7625/g' feeds/packages/net/socat/Makefile

wget -O feeds/packages/net/uugamebooster/Makefile https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/mi_patch/uu_Makefile

rm -rf feeds/packages/net/frp/*
wget -O feeds/packages/net/frp/Makefile https://raw.githubusercontent.com/coolsnowwolf/packages/4812305c004b3049388c358c341f443a2ee59949/net/frp/Makefile

sed -i 's/8056c2e21c000001/9f77fc393e758059/g' feeds/packages/net/zerotier/files/etc/config/zerotier

rm -rf feeds/packages/net/geoview
rm -rf feeds/packages/net/lucky

# 添加 luci-app-mosdns
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

#zip -rP Jsz3895 files.zip files
#wget -O files.zip https://raw.githubusercontent.com/takayukileung/lede/master/tools/files_nasjp.zip
#unzip -P Jsz3895 files.zip
#rm files.zip

# 添加 luci-app-passwall
#rm -rf feeds/small/luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall.git package/openwrt-passwall
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/openwrt-passwall-packages

#sed -i 's/6.1/5.4/g' target/linux/x86/Makefile

sed -i 's/1.76.1/1.80.2/g' feeds/packages/net/tailscale/Makefile
sed -i 's/ce87e52fd4e8e52540162a2529c5d73f5f76c6679147a7887058865c9e01ec36/b4d5eb15e2d11ad71803dea8ec8ddcaf5a400eabe12a5f469d133cfeae56678b/g' feeds/packages/net/tailscale/Makefile
#git clone https://github.com/mitsukileung/luci-app-tailscale.git package/luci-app-tailscale

#wget -O feeds/small/luci-app-ssr-plus/root/etc/config/shadowsocksr https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/mi_patch/shadowsocksr

git clone -b dev https://github.com/justice2001/luci-app-multi-frpc.git package/luci-app-multi-frpc

git clone https://github.com/gdy666/luci-app-lucky.git package/lucky

# 重新添加 luci-app-serverchan
#rm -rf feeds/luci/applications/luci-app-serverchan
git clone -b openwrt-18.06 https://github.com/tty228/luci-app-wechatpush.git package/luci-app-wechatpush


git clone https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic

# 重新添加 luci-app-netdata
#rm -rf feeds/luci/applications/luci-app-netdata
#git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata
#在rm前面加一行内容为“chmod +x /etc/init.d/netdata”
#sed -i '/rm/i chmod +x /etc/init.d/netdata' package/luci-app-netdata/root/etc/uci-defaults/40_luci-app-netdata
#sed -i 's/0/1/g' package/luci-app-netdata/root/etc/config/netdata && sed -i 's/19991/19990/g' package/luci-app-netdata/root/etc/config/netdata

# 重新添加 luci-app-aliyundrive-webdav
#rm -rf feeds/luci/applications/luci-app-aliyundrive-webdav
#rm -rf feeds/packages/multimedia/aliyundrive-webdav
#git clone https://github.com/messense/aliyundrive-webdav.git package/luci-app-aliyundrive-webdav

# 添加 luci-app-unblockneteasemusic
#git clone -b master https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/luci-app-unblockneteasemusic

# 重新添加 luci-app-pushbot
#rm -rf feeds/luci/applications/luci-app-pushbot
#git clone https://github.com/zzsj0928/luci-app-pushbot.git package/luci-app-pushbot

# 添加 smartdns
#git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# 添加 adguardhome
#git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

# 添加 filebrowser
#git clone https://github.com/takayukileung/luci-app-filebrowser.git package/luci-app-filebrowser

# 添加 OpenClash
git clone -b dev https://github.com/vernesong/OpenClash.git --depth=1 package/openclash

# 添加 luci-theme-neobird 主题
#git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird

# 添加 luci-theme-design.git 主题
#rm -rf feeds/luci/themes/luci-theme-design
#rm -rf feeds/luci/applications/luci-app-design-config
#git clone https://github.com/gngpp/luci-theme-design.git package/luci-theme-design
#git clone https://github.com/gngpp/luci-app-design-config.git package/luci-app-design-config

echo 'refresh feeds'
./scripts/feeds update -a
./scripts/feeds install -a
