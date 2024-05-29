package com.example.platform_channels_app

import io.flutter.plugin.common.EventChannel
import android.app.Activity
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.provider.Settings
import android.os.BatteryManager

class BroadCastStreamHandler(isEnabled: Boolean, activity:Activity) : EventChannel.StreamHandler {
    private var isEnabledDevice: Boolean = isEnabled
    private val activityDevice: Activity = activity
    private lateinit var eventSink: EventChannel.EventSink

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
            if (events != null) {
                eventSink = events
            }
            val bReceiver = object : BroadcastReceiver() {
                override fun onReceive(context: Context?, intent: Intent?) {
                    val isAirplaneModeEnabled = Settings.System.getInt(context?.contentResolver,Settings.Global.AIRPLANE_MODE_ON, 0) != 0
                    eventSink.success(isAirplaneModeEnabled)
                    when (intent?.action) {
                        Intent.ACTION_AIRPLANE_MODE_CHANGED-> {
                            eventSink.success(isAirplaneModeEnabled)
                        }
                        Intent.ACTION_BATTERY_CHANGED -> {
                            val batteryStatus: Int = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1)
                            val isCharging: Boolean = batteryStatus == BatteryManager.BATTERY_STATUS_CHARGING ||
                                    batteryStatus == BatteryManager.BATTERY_STATUS_FULL
                            if (isCharging) {
                                
                            } else {
                                
                            }
                        }
                        Intent.ACTION_POWER_CONNECTED -> {
                            
                        }
                        Intent.ACTION_POWER_DISCONNECTED -> {
                            
                        }
                    }
                }
            }
            activityDevice.registerReceiver(bReceiver, IntentFilter().apply {
                addAction(Intent.ACTION_AIRPLANE_MODE_CHANGED)
                addAction(Intent.ACTION_BATTERY_CHANGED)
                addAction(Intent.ACTION_POWER_CONNECTED)
                addAction(Intent.ACTION_POWER_DISCONNECTED)
            })
    }

    override fun onCancel(arguments: Any?) {
       
    }
}


