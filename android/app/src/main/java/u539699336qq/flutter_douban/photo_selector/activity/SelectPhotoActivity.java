package u539699336qq.flutter_douban.photo_selector.activity;

import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.os.Bundle;
import android.util.Log;
import android.widget.ImageView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import java.io.File;
import java.util.ArrayList;
import java.util.Objects;

import qiu.niorgai.StatusBarCompat;
import top.androidman.SuperButton;
import top.zibin.luban.Luban;
import top.zibin.luban.OnCompressListener;
import u539699336qq.flutter_douban.R;
import u539699336qq.flutter_douban.photo_selector.adapter.SelectImageAdapter;
import u539699336qq.flutter_douban.photo_selector.bean.ImageListBean;
import u539699336qq.flutter_douban.photo_selector.util.GalleryPhotoUtil;
import u539699336qq.flutter_douban.photo_selector.util.PhotoSelectorUtil;
import u539699336qq.flutter_douban.photo_selector.util.StatusBarUtil;

import static android.Manifest.permission.READ_EXTERNAL_STORAGE;

public class SelectPhotoActivity extends AppCompatActivity {
    private ArrayList<String> originalImageList;
    private ArrayList<String> compressedImageList;
    private ArrayList<String> selectedImageList;
    private ArrayList<ImageListBean> imageInfoList;
    private RecyclerView recyclerView;
    private SelectImageAdapter selectImageAdapter;
    private SuperButton superButton;
    private ImageView backIcon;
    private int compressedImageCount = 0;
    private int selectImageCount = 0;

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        for (int i = 0; i < grantResults.length; i++) {
            if (grantResults[i] != PackageManager.PERMISSION_GRANTED) {
                finish();
                return;
            }
        }
        initView();
        initData();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_select_photo);
        StatusBarCompat.setStatusBarColor(this, Color.parseColor("#E1F5F7F5"));
        StatusBarUtil.setStatusBarMode(this, true);
        checkReadPermission();
    }

    private void checkReadPermission() {
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE)
                != PackageManager.PERMISSION_GRANTED ||
                ContextCompat.checkSelfPermission(this, READ_EXTERNAL_STORAGE)
                        != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE,
                            Manifest.permission.READ_EXTERNAL_STORAGE},
                    1);
        } else {
            initView();
            initData();
        }
    }

    private void initView() {
        backIcon = findViewById(R.id.iv_back);
        superButton = findViewById(R.id.btn_selected_count);
        recyclerView = findViewById(R.id.rv2);
        GridLayoutManager gridLayoutManager = new GridLayoutManager(this, 4);
        recyclerView.setLayoutManager(gridLayoutManager);
    }

    private void initData() {
        compressedImageList = new ArrayList<>();
        selectedImageList = new ArrayList<>();
        imageInfoList = new ArrayList<>();
        compressImages();
    }

    private void initListener() {
        superButton.setOnClickListener(v -> prepareFinish());
        backIcon.setOnClickListener(v -> {
            finish();
        });

        selectImageAdapter.setOnItemClickListener((adapter, view, position) -> {
            Intent intent = new Intent(SelectPhotoActivity.this, PhotoDetailActivity.class);
            intent.putExtra("path", selectImageAdapter.getData().get(position).getFilePath());
            startActivity(intent);
        });

        selectImageAdapter.setOnItemChildClickListener((adapter, view, position) -> {
            if (view.getId() == R.id.checkbox) {

                if (imageInfoList.get(position).isChecked()) {
                    imageInfoList.get(position).setChecked(false);
                    selectImageCount--;
                    updateButtonText();
                } else {

                    if (selectImageCount == 9) {
                        Toast.makeText(SelectPhotoActivity.this, "最多只能选择9张图片", Toast.LENGTH_SHORT).show();
                        return;
                    }

                    imageInfoList.get(position).setChecked(true);
                    selectImageCount++;
                    updateButtonText();
                }
                selectImageAdapter.notifyItemChanged(position);
            }
        });
    }


    private void updateButtonText() {
        superButton.setText("确定 " + selectImageCount + "/" + compressedImageList.size());
    }

    /**
     * 压缩图片，压缩图片完毕后进行更新UI
     */
    private void compressImages() {
        originalImageList = GalleryPhotoUtil.getGalleryPhoto(getContentResolver());
        Log.e("Debug:::", "original：："+originalImageList.size() );
        Luban.with(SelectPhotoActivity.this).load(originalImageList).setCompressListener(new OnCompressListener() {
            @Override
            public void onStart() {
            }

            @Override
            public void onSuccess(File file) {
                compressedImageCount++;
                compressedImageList.add(file.getPath());
                if ((compressedImageCount == originalImageList.size()) && selectImageAdapter == null) {
                    updateUI();
                }
            }

            @Override
            public void onError(Throwable e) {
            }
        }).launch();
    }

    /**
     * 更新列表
     */
    private void updateUI() {
        Log.e("Debug:::",  "compressed"+compressedImageList.size() );

        superButton.setText("确定 " + selectImageCount + "/" + compressedImageList.size());
        ImageListBean bean;
        for (int i = 0; i < compressedImageList.size(); i++) {
            bean = new ImageListBean();
            bean.setFilePath(compressedImageList.get(i));
            imageInfoList.add(bean);
        }
        selectImageAdapter = new SelectImageAdapter(R.layout.item, imageInfoList);
        ((DefaultItemAnimator) Objects.requireNonNull(recyclerView.getItemAnimator())).setSupportsChangeAnimations(false);
        initListener();
        recyclerView.setAdapter(selectImageAdapter);
    }

    private void prepareFinish() {
        if (selectImageCount == 0) {
            return;
        }
        for (ImageListBean item :
                selectImageAdapter.getData()) {
            if (item.isChecked()) {
                selectedImageList.add(item.getFilePath());
            }
        }
        Intent intent = new Intent();
        Bundle bundle = new Bundle();
        bundle.putStringArrayList(PhotoSelectorUtil.RESULT_KEY, selectedImageList);
        intent.putExtras(bundle);
        setResult(PhotoSelectorUtil.PHOTO_SELECTOR_RESULT_CODE, intent);
        finish();
    }
}

