
set android_sdk '/opt/android_sdk'
if test -d $android_sdk
  set -x ANDROID_SDK $android_sdk
  set -x ANDROID_HOME $android_sdk
  set -x PATH $PATH "$android_sdk/tools" "$android_sdk/platform-tools"
end

set android_ndk '/opt/android_ndk'
if test -d $android_ndk
  set -x ANDROID_NDK_REPOSITORY $android_ndk
end