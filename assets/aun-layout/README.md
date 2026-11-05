# AUN-Layout

Bilder im Design von AUN, gestaltet für dieses Projekt. Verkleinert aus den Originalen (JPG, Qualität 88; das freigestellte Logo als PNG mit 1200 px Breite).

| Ordner | Inhalt | Verwendung |
|---|---|---|
| `kodi-wallpaper/` | 10 Wallpaper, 1920×1080 | Kodi-Hintergrund; eines davon als Hintergrund der Startseite (`homepage_hintergrund`) |
| `emby-bibliotheken/` | 8 Bibliotheksbilder, 1920×1080 | Emby: Bibliothek → ⋮ → Bilder bearbeiten |
| `logos/` | Logos, freigestellt und auf Schwarz, Favicon | Startseite, Cockpit, Bootmenü |
| `github/` | Banner 1600×400, Vorschau 1280×640 | Profil der Organisation, Social Preview |
| `sonstiges/` | Collage | – |
| `system/` | Cockpit-Logo, Favicon und Hintergrund der Anmeldung (Rauch ohne Logo), Bootbild 640×480 | Cockpit (`/etc/cockpit/branding`), Bootmenü des ISO |

Mit `aun_layout: true` (Standard) kopiert das Setup diesen Ordner nach `\\<NAS>\shares\AUN-Layout` und setzt das Branding von Cockpit. Das Bootbild ist immer im ISO.
