class ThemeInstaller extends InstallerBase {
    name := "Theme Installer"
    installerType := InstallerBase.INSTALLER_TYPE_REQUIREMENT

    __New(appVersion, appState, cacheManager, cacheName, versionSorter, downloadThemes := "", tmpDir := "", themesDir := "") {
        components := []

        if (downloadThemes != "") {
            if (!themesDir) {
                themesDir := "resources\themes"
            }

            for key, url in downloadThemes {
                path := themesDir . "\" . key . ".json"
                cache := cacheManager[cacheName]
                components.Push(DownloadableInstallerComponent(this.version, url, false, path, appState, cache, key . "Theme", "Themes", false, tmpDir, false))
            }
        }

        super.__New(appVersion, appState, "Themes", cacheManager, cacheName, versionSorter, components, tmpDir)
    }
}
