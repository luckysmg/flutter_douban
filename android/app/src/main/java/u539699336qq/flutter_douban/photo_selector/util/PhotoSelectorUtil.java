package u539699336qq.flutter_douban.photo_selector.util;

import android.app.Activity;
import android.content.Intent;

import androidx.annotation.NonNull;


import java.util.ArrayList;

import u539699336qq.flutter_douban.photo_selector.activity.SelectPhotoActivity;

public class PhotoSelectorUtil {
    public static final String RESULT_KEY = "photos";
    public static final int PHOTO_SELECTOR_REQUEST_CODE = 12000;
    public static final int PHOTO_SELECTOR_RESULT_CODE = 12001;

    public static void startSelectPhoto(Activity activity) {
        Intent intent = new Intent(activity, SelectPhotoActivity.class);
        activity.startActivityForResult(intent, PHOTO_SELECTOR_REQUEST_CODE);
    }

    public static ArrayList<String> getResult(@NonNull Intent data) {
        ArrayList<String> list;
        if (data.getExtras() != null) {
            list = data.getExtras().getStringArrayList(RESULT_KEY);
            return list;
        } else {
            return null;
        }


    }
}
