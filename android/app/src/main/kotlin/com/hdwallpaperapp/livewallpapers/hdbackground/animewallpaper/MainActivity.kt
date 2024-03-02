package com.hdwallpaperapp.livewallpapers.hdbackground.animewallpaper

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import java.util.Objects


class MainActivity : FlutterActivity() {
    //    static final String userId = "";
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

//    GeneratedPluginRegistrant.registerWith(this);
        //GeneratedPluginRegistrant.registerWith(new FlutterEngine(this));
        Objects.requireNonNull(flutterEngine)?.dartExecutor.let {
            if (it != null) {
                MethodChannel(
                    it.binaryMessenger,
                    CHANNEL
                ).setMethodCallHandler { call, result ->

                }
            }
        }
    }

    companion object {
        private const val CHANNEL = "flutter.native/helper"
    }
}
