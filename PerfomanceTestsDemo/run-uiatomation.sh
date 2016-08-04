#!/bin/bash

killall "Simulator"

xcodebuild \
-project PerfomanceTestsDemo.xcodeproj \
-scheme PerfomanceTestsDemo \
-derivedDataPath build \
-sdk iphonesimulator9.3 \
-configuration Debug \
clean \
build

instruments \
-w "iPhone 5s (9.3)" \
-t "/Applications/Xcode.app/Contents/Applications/Instruments.app/Contents/PlugIns/AutomationInstrument.xrplugin/Contents/Resources/Automation.tracetemplate" \
"build/Build/Products/Debug-iphonesimulator/PerfomanceTestsDemo.app" \
-e UIASCRIPT "UIAutomation/Search.js" \
-e UIARESULTSPATH "UIAutomation"

xcrun simctl uninstall booted com.griddynamics.PerfomanceTestsDemo
