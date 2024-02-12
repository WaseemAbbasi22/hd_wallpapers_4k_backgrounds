package com.hdwallpaperapp.livewallpapers.hdbackground.animewallpaper

import android.os.Bundle
import com.amazonaws.mobile.client.AWSMobileClient
import com.amazonaws.mobile.client.Callback
import com.amazonaws.mobile.client.UserStateDetails
import com.amplifyframework.auth.cognito.AWSCognitoAuthPlugin
import com.amplifyframework.core.Amplify
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
                    if (call.method == "sendIDToAWSFromNative") {

                        val id = call.argument<String>("id")
                        val greetings = sendOpenIDToAWS(id)
                        //                                            String greetings = helloFromNativeCode(s);
                        result.success(greetings)
                        // Log.e("TAG", s);
                        // System.out.print(s
                    }
                }
            }
        }
    }

    private fun sendOpenIDToAWS(idToken: String?): String {
//        final String[] userID = new String[1];
        // Add this line, to include the Auth plugin.
        val mobileClient =
            (Amplify.Auth.getPlugin("awsCognitoAuthPlugin").escapeHatch as AWSMobileClient?)!!
        val user = arrayOf("")
        mobileClient.federatedSignIn("securetoken.google.com/wallpapers4klatest", idToken,
            object : Callback<UserStateDetails> {
                override fun onResult(userStateDetails: UserStateDetails) {
                    // return 'succesfull';
                    user[0] = userStateDetails.toString()
                    //                        Log.d("myTag", "" + user[0]);
                }

                override fun onError(e: Exception) {
                    //   return e;
//                        e.printStackTrace();
//                        Log.d("myTag", "This is my message in error callback $e");
                }
            }
        )
        //        Log.i("myTag", userId);
        return mobileClient.identityId
    }

    companion object {
        private const val CHANNEL = "flutter.native/helper"
    }
}
