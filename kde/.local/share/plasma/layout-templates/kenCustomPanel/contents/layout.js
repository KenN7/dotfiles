var panel = new Panel
var panelScreen = panel.screen
panel.location = "top"

// No need to set panel.location as ShellCorona::addPanel will automatically pick one available edge

// For an Icons-Only Task Manager on the bottom, *3 is too much, *2 is too little
// Round down to next highest even number since the Panel size widget only displays
// even numbers
panel.height = Math.floor(gridUnit * 2.5 / 2)

// Restrict horizontal panel to a maximum size of a 21:9 monitor
const maximumAspectRatio = 21 / 9;
if (panel.formFactor === "horizontal") {
    const geo = screenGeometry(panelScreen);
    const maximumWidth = Math.ceil(geo.height * maximumAspectRatio);

    if (geo.width > maximumWidth) {
        panel.alignment = "center";
        panel.minimumLength = maximumWidth;
        panel.maximumLength = maximumWidth;
    }
}

var kickoff = panel.addWidget("org.kde.plasma.kickoff")
kickoff.currentConfigGroup = ["Shortcuts"]
kickoff.writeConfig("global", "Alt+F1")

//panel.addWidget("org.kde.plasma.showActivityManager")
panel.addWidget("org.kde.plasma.pager")
panel.addWidget("org.kde.plasma.taskmanager")
panel.addWidget("org.kde.plasma.marginsseparator")
panel.addWidget("org.kde.plasma.systemmonitor.net")

/* Next up is determining whether to add the Input Method Panel
 * widget to the panel or not. This is done based on whether
 * the system locale's language id is a member of the following
 * white list of languages which are known to pull in one of
 * our supported IME backends when chosen during installation
 * of common distributions. */

var langIds = ["as",    // Assamese
    "bn",    // Bengali
    "bo",    // Tibetan
    "brx",   // Bodo
    "doi",   // Dogri
    "gu",    // Gujarati
    "hi",    // Hindi
    "ja",    // Japanese
    "kn",    // Kannada
    "ko",    // Korean
    "kok",   // Konkani
    "ks",    // Kashmiri
    "lep",   // Lepcha
    "mai",   // Maithili
    "ml",    // Malayalam
    "mni",   // Manipuri
    "mr",    // Marathi
    "ne",    // Nepali
    "or",    // Odia
    "pa",    // Punjabi
    "sa",    // Sanskrit
    "sat",   // Santali
    "sd",    // Sindhi
    "si",    // Sinhala
    "ta",    // Tamil
    "te",    // Telugu
    "th",    // Thai
    "ur",    // Urdu
    "vi",    // Vietnamese
    "zh_CN", // Simplified Chinese
    "zh_TW"] // Traditional Chinese

if (langIds.indexOf(languageId) != -1) {
    panel.addWidget("org.kde.plasma.kimpanel");
}

panel.addWidget("org.kde.plasma.systemtray")
panel.addWidget("org.kde.plasma.digitalclock")
panel.addWidget("org.kde.plasma.showdesktop")


// Create bottom panel (Dock)
const dock = new Panel

// Basic Dock Geometry
dock.alignment = "center"
dock.height = Math.round(gridUnit * 3.5);
dock.hiding = "windowscover"
dock.location = "bottom"
dock.maximumLenth = 1000
dock.minimumLength = 250

// Icons-Only Task Manager
var tasks = dock.addWidget("org.kde.plasma.icontasks")
tasks.currentConfigGroup = ["General"]
tasks.writeConfig("fill", false)
tasks.writeConfig("iconSpacing", 2)
tasks.writeConfig("launchers", "applications:garuda-welcome.desktop,applications:org.kde.konsole.desktop,preferred://browser,preferred://filemanager,applications:org.kde.plasma-systemmonitor.desktop,applications:systemsettings.desktop")
tasks.writeConfig("maxStripes", 1)
tasks.writeConfig("showOnlyCurrentScreen", true)

