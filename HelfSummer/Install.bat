@echo off
chcp 65001 >nul
title 苏半夏鼠标美化包一键安装器 - 花沫制作
cls

echo.
echo.
echo ========================================
echo  HelfSummer 苏半夏鼠标美化包-花沫设计
echo ========================================
echo.
echo.           开源免费，禁止倒卖！
echo.

:: 检查管理员权限
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo 需要管理员权限...
    echo 请右键点击此文件，选择"以管理员身份运行"
    echo.
    pause
    exit /b 1
)

:: 切换到脚本所在目录
pushd "%~dp0"
echo 当前目录: %cd%
echo.

echo 1. 创建目录...
mkdir "C:\Windows\Cursors\HelfSummer" 2>nul
echo.

echo 2. 复制文件...
set count=0
for %%f in (*.cur) do (
    copy "%%f" "C:\Windows\Cursors\HelfSummer\" /Y >nul
    set /a count+=1
)
echo.

echo 3. 正在注册光标方案...
set "schemePath=%SystemRoot%\Cursors\HelfSummer\"

set "schemeEntry=%schemePath%pointer.cur"
set "schemeEntry=%schemeEntry%,%schemePath%help.cur"
set "schemeEntry=%schemeEntry%,%schemePath%busy.cur"
set "schemeEntry=%schemeEntry%,%schemePath%working.cur"
set "schemeEntry=%schemeEntry%,%schemePath%cross.cur"
set "schemeEntry=%schemeEntry%,%schemePath%text.cur"
set "schemeEntry=%schemeEntry%,%schemePath%handwriting.cur"
set "schemeEntry=%schemeEntry%,%schemePath%unavailable.cur"
set "schemeEntry=%schemeEntry%,%schemePath%vert.cur"
set "schemeEntry=%schemeEntry%,%schemePath%horz.cur"   :: 10. 水平调整大小
set "schemeEntry=%schemeEntry%,%schemePath%dgn1.cur"   :: 11. 对角调整大小1
set "schemeEntry=%schemeEntry%,%schemePath%dgn2.cur"   :: 12. 对角调整大小2
set "schemeEntry=%schemeEntry%,%schemePath%move.cur"   :: 13. 移动
set "schemeEntry=%schemeEntry%,%schemePath%alternate.cur" :: 14. 候选
set "schemeEntry=%schemeEntry%,%schemePath%link.cur"
set "schemeEntry=%schemeEntry%,%schemePath%loc.cur"    :: 16. 位置选择
set "schemeEntry=%schemeEntry%,%schemePath%person.cur" :: 17. 个人选择


reg add "HKCU\Control Panel\Cursors\Schemes" /v "苏半夏鼠标 花沫制作" /t REG_SZ /d "%schemeEntry%" /f >nul
echo.

echo 4. 应用光标方案
reg add "HKCU\Control Panel\Cursors" /v "Scheme" /t REG_SZ /d "苏半夏鼠标 花沫制作" /f >nul

echo.
echo ========================================
echo   安装完成！请重启您的电脑！感谢使用！
echo ========================================
echo.
echo 1. 请重启电脑后手动应用光标方案
echo.
echo 2. 右键点击桌面  个性化
echo.
echo 3. 选择 主题  鼠标光标
echo.
echo 4. 在方案中选择 苏半夏鼠标 花沫制作
echo.
echo 5. 点击 应用  确定 
echo.
pause