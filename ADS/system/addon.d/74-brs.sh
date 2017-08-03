#!/sbin/sh
#
# /system/addon.d/74-brs.sh
#
. /tmp/backuptool.functions

list_files() {
cat <<EOF

EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/$FILE
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/$FILE $R
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
	rm -rf /system/app/BookmarkProvider
	rm -rf /system/app/Tycho
	rm -rf /system/app/BasicDreams
	rm -rf /system/app/LiveWallpapers
	rm -rf /system/app/LiveWallpapersPicker
	rm -rf /system/app/Stk
	rm -rf /system/app/ExactCalculator
	rm -rf /system/app/LatinIMEGooglePrebuilt
	rm -rf /system/app/BasicDreams

   
	rm -rf /system/priv-app/OneTimeInitializer
	rm -rf /system/priv-app/ThemeInterfacer
	rm -rf /system/priv-app/GCS
	rm -rf /system/priv-app/HotwordEnrollment
	rm -rf /system/priv-app/Contacts
	rm -rf /system/priv-app/Dialer
    rm -rf /system/priv-app/CellBroadcastReceiver
    rm -rf /system/priv-app/Tag
    rm -rf /system/priv-app/DocumentsUI
  ;;
esac
