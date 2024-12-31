package thrive.myle

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.app.role.RoleManager
import android.content.Context
import android.content.Intent
import android.os.Build
import android.net.Uri

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.yourdomain.browser/default_browser"
    private val ROLE_REQUEST_CODE = 1001
    private var flutterMethodChannel: MethodChannel? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        flutterMethodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        flutterMethodChannel?.setMethodCallHandler { call, result ->
            when (call.method) {
                "setDefaultBrowser" -> {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                        val roleManager = getSystemService(Context.ROLE_SERVICE) as RoleManager
                        if (roleManager.isRoleAvailable(RoleManager.ROLE_BROWSER)) {
                            startActivityForResult(
                                roleManager.createRequestRoleIntent(RoleManager.ROLE_BROWSER),
                                ROLE_REQUEST_CODE
                            )
                            result.success(true)
                        } else {
                            result.success(false)
                        }
                    } else {
                        result.success(false)
                    }
                }
                else -> result.notImplemented()
            }
        }

        // Handle initial URL if app was started from URL
        intent?.data?.toString()?.let { url ->
            flutterMethodChannel?.invokeMethod("loadUrl", url)
        }
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        // Handle URL when app is already running
        intent.data?.toString()?.let { url ->
            flutterMethodChannel?.invokeMethod("loadUrl", url)
        }
    }
}