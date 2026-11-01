#!/bin/sh
# The vendor 3.4.34 kernel oopses in get_user_pages_fast() on the first write
# through a loop device that uses O_DIRECT, and the boot hangs on the logo.
# mount_subpartitions() in the initramfs passes --direct-io=on, so wrap losetup
# to drop that flag.
[ -e /usr/bin/losetup.real ] && exit 0
mv /usr/bin/losetup /usr/bin/losetup.real
cat > /usr/bin/losetup <<'WRAP'
#!/bin/sh
for a; do
	shift
	[ "$a" = "--direct-io=on" ] || set -- "$@" "$a"
done
exec /usr/bin/losetup.real "$@"
WRAP
chmod +x /usr/bin/losetup
