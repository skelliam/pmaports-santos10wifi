#!/bin/sh
# When adding new paths to trigger on here, make sure to also add them in
# triggers= in the APKBUILD.
#
# openssh-server-pam ships only sshd.pam, sshd-session.pam and sshd-auth.pam,
# and nothing creates the plain names, so sshd never starts. Link them.

link() {
	[ -e "$1" ] && [ ! -e "$2" ] && ln -s "$(basename "$1")" "$2"
	return 0
}

link /usr/sbin/sshd.pam /usr/sbin/sshd
link /usr/lib/ssh/sshd-session.pam /usr/lib/ssh/sshd-session
link /usr/lib/ssh/sshd-auth.pam /usr/lib/ssh/sshd-auth

# gdk-pixbuf >= 2.44 decodes images through glycin, which sandboxes loaders with
# bubblewrap. That needs user namespaces, which kernel 3.4 does not have, so
# every image load fails and the greeter aborts. Run the loaders unsandboxed.
if [ -f /etc/environment ] && ! grep -q '^GLYCIN_DISABLE_SANDBOX=' /etc/environment; then
	echo 'GLYCIN_DISABLE_SANDBOX=1' >> /etc/environment
fi
exit 0
