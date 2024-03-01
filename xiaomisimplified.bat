@echo off
cd /d "%~dp0"
title=小米电视去广告精简系统软件
echo 请先在电视上完成以下操作
echo 并确保电脑和你的电视同属一个局域网当中
@echo.
echo 01打开开发者模式，设置：关于-版本号(产品型号)狂按确认
echo 02打开adb调试，设置：账号与安全-ADB调试，改为允许，关闭智能更新
echo 03查看IP, 设置：无线/有线-选择你已经连接的网络-IPV4地址就是你电视的IP
@echo.
echo ----------- 本脚本保留VPN组件 可以自己安装Clash等软件 @shamsky23-------------
@echo.
echo 警告：继续执行将会删除小米电视上的部分功能与软件，数据无法恢复，请谨慎操作。

echo 请输入电视IP地址，按回车键确认，此时电视会提示是否连接电脑，选择确认即可；
set /p ip=电视IP地址:

echo 正在连接，请稍后
set matchStr=connected
:connect
for /f "tokens=*" %%i in ('%~dp0adb connect %ip%') do @set  result=%%i

echo %result% | findstr %matchStr% >nul && (echo 连接成功) || (echo 连接失败，正在重试
  (goto connect))

set /p var=按Enter键开始：
echo 正在精简中，耐心等待。。。
adb shell pm uninstall --user 0 com.xm.webcontent  rem 电视活动中心  
adb shell pm uninstall --user 0 com.sogou.speech.offlineservice  rem 搜狗离线语音识别引擎  
adb shell pm uninstall --user 0 com.xiaomi.tweather rem 天气  
::本地音乐播放器  adb shell pm uninstall --user 0 com.xiaomi.mimusic2 rem  本地音乐播放器  
::小米TV播放器  adb shell pm uninstall --user 0 com.mitv.videoplayer rem  小米TV播放器  
adb shell pm uninstall --user 0 com.android.providers.downloads rem 下载管理程序  
adb shell pm uninstall --user 0 com.xiaomi.mitv.handbook rem 用户手册  
adb shell pm uninstall --user 0 com.android.certinstaller rem  证书安装  
adb shell pm uninstall --user 0 com.android.captiveportallogin rem  wifi认证  
adb shell pm uninstall --user 0 com.mitv.appstore.component.land rem  应用商店内容land  
::电视管家  adb shell pm uninstall --user 0 com.xiaomi.mitv.tvmanager rem  电视管家  
adb shell pm uninstall --user 0 com.mitv.alarmcenter rem  定时提醒  
adb shell pm uninstall --user 0 com.xiaomi.mitv.calendar rem  日历  
adb shell pm uninstall --user 0 com.mitv.gallery rem  相册  
adb shell pm uninstall --user 0 com.xiaomi.gamecenter.sdk.service.mibox rem  小米服务安全插件  
::adcare  adb shell pm uninstall --user 0 com.mitv.care rem  adcare  
adb shell pm uninstall --user 0 com.xiaomi.mitv.karaoke.service rem  卡拉OK服务  
adb shell pm uninstall --user 0 com.xiaomi.miplay rem  MIOTHOST  
adb shell pm uninstall --user 0 com.xiaomi.mibox.gamecenter rem  游戏中心  
adb shell pm uninstall --user 0 com.xiaomi.mitv.upgrade rem  系统更新  
::小米帐号  adb shell pm uninstall --user 0 com.xiaomi.account rem  小米帐号  
adb shell pm uninstall --user 0 com.droidlogic rem  droidlogic系统  
adb shell pm uninstall --user 0 com.xiaomi.mitv.payment rem  小米支付  
::电视支付  adb shell pm uninstall --user 0 com.xiaomi.mitv.pay rem  电视支付  
adb shell pm uninstall --user 0 com.xiaomi.tv.appupgrade rem  应用更新  
adb shell pm uninstall --user 0 com.xiaomi.mitv.tvpush.tvpushservice rem  电视推送  
::小米帐号授权  adb shell pm uninstall --user 0 com.xiaomi.account.auth rem  小米帐号授权  
adb shell pm uninstall --user 0 com.xiaomi.statistic rem  统计  
adb shell pm uninstall --user 0 com.mipay.wallet.tv rem  小米钱包  
adb shell pm uninstall --user 0 com.xiaomi.smarthome.tv rem  米家  
adb shell pm uninstall --user 0 com.xiaomi.mitv.appstore rem  应用商店  
adb shell pm uninstall --user 0 com.miui.tv.analytics rem  分析  
adb shell pm uninstall --user 0 com.xiaomi.mitv.shop rem  小米商城  
::设备报告  adb shell pm uninstall --user 0 com.xiaomi.devicereport rem  设备报告  
adb shell pm uninstall --user 0 com.xiaomi.mibox.lockscreen rem  锁屏  
adb shell pm uninstall --user 0 com.mi.umi rem  小米音响服务  
adb shell pm uninstall --user 0 com.mi.umifrontend rem  音响前端  
adb shell pm uninstall --user 0 com.android.proxyhandler rem  代理  
adb shell pm uninstall --user 0 com.xiaomi.mitv.advertise rem  广告应用  
adb shell pm uninstall --user 0 com.android.location.fused rem  一体化位置信息  
adb shell pm uninstall --user 0 com.xiaomi.screenrecorder rem  录屏  
adb shell pm uninstall --user 0 com.miui.systemAdSolution rem  去除开机广告  
::时尚画报  adb shell pm uninstall --user 0 com.xiaomi.tv.gallery rem  时尚画报  
adb shell pm uninstall --user 0 com.duokan.videodaily rem  今日头屏  
::不建议删除应用
::智能屏保  adb shell pm uninstall --user 0 com.mitv.screensaver rem  智能屏保  
::软件包安装程序  adb shell pm uninstall --user 0 com.android.packageinstaller rem  软件包安装程序  
::搜狗输入法  adb shell pm uninstall --user 0 com.sohu.inputmethod.sogou.tv rem  搜狗输入法  
::小米电视播放器  adb shell pm uninstall --user 0 com.mitv.mivideoplayer rem  小米电视播放器  
::pacprocessor  adb shell pm uninstall --user 0 com.pacprocessor rem  pacprocessor  
::高清播放器  adb shell pm uninstall --user 0 com.xiaomi.mitv.mediaexplorer rem  高清播放器  
::蓝牙共享  adb shell pm uninstall --user 0 com.android.bluetooth rem  蓝牙共享  
::模拟电视  adb shell pm uninstall --user 0 com.xiaomi.mitv.tvplayer rem  模拟电视  
::upnp  adb shell pm uninstall --user 0 com.xiaomi.upnp rem  upnp  
::无线投屏  adb shell pm uninstall --user 0 com.xiaomi.mitv.smartshare rem  无线投屏  
::米联  adb shell pm uninstall --user 0 com.xiaomi.milink.udt rem  米联  
::upnpapp  adb shell pm uninstall --user 0 com.mi.miplay.mitvupnpsink rem  upnpapp  
::DLNA连接  adb shell pm uninstall --user 0 com.xiaomi.dlnatvservice rem  DLNA连接  
::投屏神器  adb shell pm uninstall --user 0 com.xiaomi.mitv.assistant.manual rem  投屏神器  
::milink服务  adb shell pm uninstall --user 0 com.duokan.airkan.tvbox rem  milink服务  
::AppLinks功能  adb shell pm uninstall --user 0 com.android.statementservice rem  AppLinks功能  
::桌面  adb shell pm uninstall --user 0 com.mitv.tvhome rem  桌面  
::无说明未测试  adb shell pm uninstall --user 0 mitv.service rem  无说明未测试  
::无说明未测试  adb shell pm uninstall --user 0 com.xiaomi.mitv.service rem  无说明未测试  
echo "恭喜您，精简成功，快去重启下电视，看看效果吧！"

@pause