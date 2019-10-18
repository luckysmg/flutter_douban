package u539699336qq.flutter_douban;


import android.net.Uri;
import android.os.Bundle;

import org.jetbrains.annotations.NotNull;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "u539699336qq.flutter_douban";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        new MethodChannel(getFlutterView(),CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(@NotNull MethodCall methodCall, @NotNull MethodChannel.Result result) {
                if ("drawableToUri".equals(methodCall.method)) {
                    int resourceId = MainActivity.this.getResources().getIdentifier((String) methodCall.arguments, "drawable", MainActivity.this.getPackageName());
                    String uriString = Uri.decode(String.valueOf(resourceId));
                    result.success(uriString);
                }
            }
        });
    }


}
