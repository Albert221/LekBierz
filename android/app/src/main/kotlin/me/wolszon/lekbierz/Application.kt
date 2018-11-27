package me.wolszon.lekbierz

import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugins.androidalarmmanager.AlarmService

class Application : FlutterApplication(), PluginRegistry.PluginRegistrantCallback {
    override fun onCreate() {
        super.onCreate()
        AlarmService.setPluginRegistrant(this)
    }

    override fun registerWith(pluginRegistry: PluginRegistry) {
        GeneratedPluginRegistrant.registerWith(pluginRegistry)
    }
}