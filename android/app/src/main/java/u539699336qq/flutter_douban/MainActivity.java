package u539699336qq.flutter_douban;


import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

import java.util.List;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;
import u539699336qq.flutter_douban.photo_selector.util.PhotoSelectorUtil;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "u539699336qq.flutter_douban";
    private MethodChannel.Result result;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        new MethodChannel(getFlutterView(),CHANNEL).setMethodCallHandler((methodCall, result) -> {
            this.result = result;
            /**  通知栏图片获取  **/
            if ("drawableToUri".equals(methodCall.method)) {
                int resourceId = MainActivity.this.getResources().getIdentifier((String) methodCall.arguments, "drawable", MainActivity.this.getPackageName());
                String uriString = Uri.decode(String.valueOf(resourceId));
                result.success(uriString);
            }else if("getPhoto".equals(methodCall.method)){
                /**  相册  **/
                PhotoSelectorUtil.startSelectPhoto(MainActivity.this);
            }
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if(requestCode == PhotoSelectorUtil.PHOTO_SELECTOR_REQUEST_CODE
        && resultCode == PhotoSelectorUtil.PHOTO_SELECTOR_RESULT_CODE){
            List<String> list = PhotoSelectorUtil.getResult(data);
            result.success(list);
        }
    }
}
