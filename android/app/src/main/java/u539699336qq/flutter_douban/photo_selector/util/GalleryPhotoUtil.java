package u539699336qq.flutter_douban.photo_selector.util;

import android.content.ContentResolver;
import android.database.Cursor;
import android.provider.MediaStore;

import java.util.ArrayList;
import java.util.Collections;

public class GalleryPhotoUtil {
    public static ArrayList<String> getGalleryPhoto(ContentResolver resolver) {
        ArrayList<String> galleryList = new ArrayList<>();
        try {
            final String[] columns = {MediaStore.Images.Media.DATA, MediaStore.Images.Media._ID};
            final String orderBy = MediaStore.Images.Media._ID;

            Cursor imageCursor =
                    resolver.query(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, columns, null,
                            null, orderBy);

            if (imageCursor != null && imageCursor.getCount() > 0) {
                while (imageCursor.moveToNext()) {
                    int dataColumnIndex = imageCursor.getColumnIndex(MediaStore.Images.Media.DATA);
                    String path = "file://" + imageCursor.getString(dataColumnIndex);
                    galleryList.add(path);
                }
            }
            if (imageCursor != null) {
                imageCursor.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        Collections.reverse(galleryList);
        return galleryList;
    }
}
