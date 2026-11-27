@echo off
chcp 65001 > nul
set CSC_IDENTITY_AUTO_DISCOVERY=false

echo [WD Corperation] 의존성 설치 및 Windows 설치용 .exe 빌드를 시작합니다...
call npm install
if errorlevel 1 (
  echo [오류] npm install 단계에서 문제가 발생했습니다.
  pause
  exit /b 1
)

call npx electron-builder --win --publish never
if errorlevel 1 (
  echo [오류] electron-builder 빌드 단계에서 문제가 발생했습니다.
  pause
  exit /b 1
)

echo.
echo [완료] dist 폴더 안에 WD_Corperation_Setup_1.0.0.exe 파일이 생성되었습니다.
pause
