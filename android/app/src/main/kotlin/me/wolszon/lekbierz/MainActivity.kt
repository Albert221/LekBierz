package me.wolszon.lekbierz

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.view.FlutterMain.startInitialization

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
//        startInitialization(this)
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
    }
}
