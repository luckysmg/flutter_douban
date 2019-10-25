package u539699336qq.flutter_douban.photo_selector.adapter;


import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.bumptech.glide.Glide;
import com.chad.library.adapter.base.BaseQuickAdapter;
import com.chad.library.adapter.base.BaseViewHolder;
import com.github.chrisbanes.photoview.PhotoView;

import java.util.List;

import u539699336qq.flutter_douban.R;

public class ImageAdapter extends BaseQuickAdapter<String, BaseViewHolder> {
    public ImageAdapter(int layoutResId, @Nullable List<String> data) {
        super(layoutResId, data);
    }

    @Override
    protected void convert(@NonNull BaseViewHolder helper, String item) {
        PhotoView photoView = helper.getView(R.id.img);
        Glide.with(mContext)
                .load(item)
                .into(photoView);
    }
}
