function screen-record -d "Use adb to capture a screen recording"
  set ddd (date +%s)
  echo "Run these commands to pull once recorded."
  echo "> adb pull /sdcard/screenrec.mp4 ~/Downloads/screenrecord_$ddd.mp4"
  echo "> adb shell rm /sdcard/screenrec.mp4"
  echo "Recording..."
  command adb shell screenrecord /sdcard/screenrec.mp4
end
