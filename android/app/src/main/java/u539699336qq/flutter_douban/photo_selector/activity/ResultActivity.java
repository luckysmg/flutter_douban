package u539699336qq.flutter_douban.photo_selector.activity;

import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.chad.library.adapter.base.BaseQuickAdapter;

import java.util.List;

import qiu.niorgai.StatusBarCompat;
import u539699336qq.flutter_douban.R;
import u539699336qq.flutter_douban.photo_selector.adapter.ImageAdapter;
import u539699336qq.flutter_douban.photo_selector.util.PhotoSelectorUtil;
import u539699336qq.flutter_douban.photo_selector.util.StatusBarUtil;

public class ResultActivity extends AppCompatActivity {
    RecyclerView recyclerView;
    private ImageAdapter imageAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_result);
        StatusBarCompat.setStatusBarColor(this, Color.parseColor("#f5f5f5"));
        StatusBarUtil.setStatusBarMode(this, true);

        recyclerView = findViewById(R.id.rv);
        GridLayoutManager gridLayoutManager = new GridLayoutManager(this, 3);
        gridLayoutManager.setSpanCount(3);
        recyclerView.setLayoutManager(gridLayoutManager);


        findViewById(R.id.btn).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                PhotoSelectorUtil.startSelectPhoto(ResultActivity.this);
            }
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == PhotoSelectorUtil.PHOTO_SELECTOR_REQUEST_CODE
                && resultCode == PhotoSelectorUtil.PHOTO_SELECTOR_RESULT_CODE) {

            if (data != null) {
                List<String> photos = PhotoSelectorUtil.getResult(data);
                if (imageAdapter == null) {
                    imageAdapter = new ImageAdapter(R.layout.item_has_selected, photos);
                    setAdapterListener();
                    recyclerView.setAdapter(imageAdapter);
                } else {
                    imageAdapter.setNewData(photos);
                }
            }

        }

    }

    private void setAdapterListener() {
        imageAdapter.setOnItemClickListener(new BaseQuickAdapter.OnItemClickListener() {
            @Override
            public void onItemClick(BaseQuickAdapter adapter, View view, int position) {
                Intent intent = new Intent(ResultActivity.this, PhotoDetailActivity.class);
                intent.putExtra("path", imageAdapter.getData().get(position));
                startActivity(intent);
            }
        });

    }
}
