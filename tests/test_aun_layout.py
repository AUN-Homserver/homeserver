"""Tests für assets/aun-layout: python3 -m unittest discover -s tests"""

import glob
import os
import unittest

import yaml

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
LAYOUT = os.path.join(REPO, "assets", "aun-layout")


class AunLayout(unittest.TestCase):
    def test_jeder_hintergrund_hat_genau_ein_wallpaper(self):
        with open(os.path.join(REPO, "config", "schema.yml"), encoding="utf-8") as f:
            werte = yaml.safe_load(f)["einstellungen"]["homepage_hintergrund"]["werte"]
        for name in werte:
            treffer = glob.glob(os.path.join(LAYOUT, "kodi-wallpaper", f"aun-wallpaper-*-{name}.jpg"))
            self.assertEqual(len(treffer), 1, name)

    def test_favicon_vorhanden(self):
        self.assertTrue(os.path.isfile(os.path.join(LAYOUT, "logos", "aun-favicon.png")))


if __name__ == "__main__":
    unittest.main()
