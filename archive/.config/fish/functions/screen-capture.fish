function screen-capture -d "Use adb to capture the current screen"
  set ddd (date +%s)
  command adb shell screencap -p /sdcard/screencap.png
  command adb pull /sdcard/screencap.png "$HOME/Downloads/screenshot_$ddd.png"
  command adb shell rm /sdcard/screencap.png
end
