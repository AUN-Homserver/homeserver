#!/usr/bin/env bash
# aunserver-erststart.service (persönliches ISO, D24): aunserver-setup --yes mit der Konfiguration
# vom ISO. Datenplatte über die Seriennummer aus erststart.env (Gerätenamen sind beim Booten nicht
# stabil); eine Platte mit Label AUNDATA wird nur eingehängt.
set -euo pipefail
# shellcheck source=/dev/null
. /etc/aunserver/erststart.env   # DATENPLATTE, RESTORE, ADMIN

# network-online.target heißt nicht, dass Namen schon aufgelöst werden: im VM-Test brach apt-get
# beim ersten Start mit "Temporärer Fehlschlag beim Auflösen" ab. Bis zu 5 Minuten warten.
for _ in $(seq 60); do
  getent hosts deb.debian.org >/dev/null && break
  sleep 5
done
getent hosts deb.debian.org >/dev/null || echo "Warnung: deb.debian.org nach 5 Minuten nicht auflösbar, versuche es trotzdem." >&2

args=(--yes)
if [ -z "$(blkid -t LABEL=AUNDATA -o device 2>/dev/null || true)" ] && [ -n "${DATENPLATTE:-}" ]; then
  platte=$(lsblk -dn -o NAME,SERIAL | awk -v s="$DATENPLATTE" '$2 == s {print $1}')
  [ -n "$platte" ] || { echo "Keine Platte mit Seriennummer $DATENPLATTE gefunden, nichts formatiert." >&2; exit 1; }
  echo "== Datenplatte: /dev/$platte (Seriennummer $DATENPLATTE)"
  args+=(--data-disk "$platte" --format --confirm-disk "$platte")
fi
[ "${RESTORE:-0}" = 1 ] && args+=(--restore)

SUDO_USER=$ADMIN /opt/aunserver/bin/aunserver-setup "${args[@]}"
rm -f /etc/aunserver/erststart.env
systemctl disable aunserver-erststart.service
