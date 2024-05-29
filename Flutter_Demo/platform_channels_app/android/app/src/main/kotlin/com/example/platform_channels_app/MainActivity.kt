package com.example.platform_channels_app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.*
import android.hardware.Sensor
import android.hardware.SensorManager
import java.io.InputStream
import java.nio.ByteBuffer


import com.google.gson.Gson
import com.google.gson.reflect.TypeToken


import android.app.Activity
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.provider.Settings
import android.os.BatteryManager


class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {

        //TODO MethodChannel
        MethodChannel(flutterEngine.dartExecutor, "methodChannelDemo")
            .setMethodCallHandler { call, result ->
                val count: Int? = call.argument<Int>("count")

                if (count == null) {
                    result.error("INVALID ARGUMENT", "Value of count cannot be null", null)
                } else {
                    when (call.method) {
                        "increment" -> result.success(count + 1)
                        "decrement" -> result.success(count - 1)
                        else -> result.notImplemented()
                    }
                }
            }

        //TODO EventChannel SENSOR_SERVICE
        val sensorManger: SensorManager = getSystemService(Context.SENSOR_SERVICE) as SensorManager
        val accelerometerSensor: Sensor = sensorManger.getDefaultSensor(Sensor.TYPE_ACCELEROMETER)
        EventChannel(flutterEngine.dartExecutor, "eventChannelDemo")
            .setStreamHandler(AccelerometerStreamHandler(sensorManger, accelerometerSensor))



        //TODO BasicMessageChannel platformImageDemo
        BasicMessageChannel(flutterEngine.dartExecutor, "platformImageDemo", StandardMessageCodec())
            .setMessageHandler { message, reply ->
                if (message == "getImage") {
                    val inputStream: InputStream = assets.open("eat_new_orleans.jpg")
                    reply.reply(inputStream.readBytes())
                }
            }

        //TODO BasicMessageChannel stringCodecDemo

        val petList = mutableListOf<Map<String, String>>()
        val gson = Gson()

        val stringCodecChannel = BasicMessageChannel(flutterEngine.dartExecutor, "stringCodecDemo", StringCodec.INSTANCE)
        BasicMessageChannel(flutterEngine.dartExecutor, "jsonMessageCodecDemo", JSONMessageCodec.INSTANCE)
            .setMessageHandler { message, reply ->
                petList.add(0, gson.fromJson(message.toString(), object : TypeToken<Map<String, String>>() {}.type))
                stringCodecChannel.send(gson.toJson(mapOf("petList" to petList)))
            }

        BasicMessageChannel(flutterEngine.dartExecutor, "binaryCodecDemo", BinaryCodec.INSTANCE)
            .setMessageHandler { message, reply ->
                val index = String(message!!.array()).toInt()
                if (index >= 0 && index < petList.size) {
                    petList.removeAt(index)
                    val replyMessage = "Removed Successfully"
                    reply.reply(ByteBuffer.allocateDirect(replyMessage.toByteArray().size).put(replyMessage.toByteArray()))
                    stringCodecChannel.send(gson.toJson(mapOf("petList" to petList)))
                } else {
                    reply.reply(null)
                }
            }

EventChannel(flutterEngine.dartExecutor.binaryMessenger, "eventChanneBReciever")
                                .setStreamHandler(BroadCastStreamHandler(false, this))

           //TODO EventChannel registerReceiver


    }
}

