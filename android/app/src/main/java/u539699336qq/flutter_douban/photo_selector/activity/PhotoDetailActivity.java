package u539699336qq.flutter_douban.photo_selector.activity;

import android.graphics.Color;
import android.os.Bundle;
import android.widget.ImageView;

import androidx.appcompat.app.AppCompatActivity;

import com.bumptech.glide.Glide;

import qiu.niorgai.StatusBarCompat;
import u539699336qq.flutter_douban.R;
import u539699336qq.flutter_douban.photo_selector.util.StatusBarUtil;

public class PhotoDetailActivity extends AppCompatActivity {
    private String path;
    private ImageView imageView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail_photo);
        StatusBarCompat.setStatusBarColor(this, Color.parseColor("#E1F5F7F5"));
        StatusBarUtil.setStatusBarMode(this, true);
        imageView = findViewById(R.id.img);
        path = getIntent().getStringExtra("path");
        Glide.with(this).load(path).into(imageView);
    }
}
