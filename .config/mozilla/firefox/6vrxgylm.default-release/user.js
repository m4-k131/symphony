// Enable userChrome.css and userContent.css
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
// Use system GTK colors as fallback
user_pref("widget.content.gtk-theme-override", "Symphony-Dark");
// Dark theme preference
user_pref("layout.css.prefers-color-scheme.content-override", 0);
// Disable Firefox's built-in theme color overrides
user_pref("browser.theme.toolbar-theme", 0);
user_pref("browser.theme.content-theme", 0);
