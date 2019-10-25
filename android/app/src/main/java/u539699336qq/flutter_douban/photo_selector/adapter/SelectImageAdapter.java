package u539699336qq.flutter_douban.photo_selector.adapter;

import android.view.View;
import android.widget.ImageView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.bumptech.glide.Glide;
import com.chad.library.adapter.base.BaseQuickAdapter;
import com.chad.library.adapter.base.BaseViewHolder;

import java.util.List;

import u539699336qq.flutter_douban.R;
import u539699336qq.flutter_douban.photo_selector.bean.ImageListBean;

public class SelectImageAdapter extends BaseQuickAdapter<ImageListBean, BaseViewHolder> {
    public SelectImageAdapter(int layoutResId, @Nullable List<ImageListBean> data) {
        super(layoutResId, data);
    }

    @Override
    protected void convert(@NonNull BaseViewHolder helper, ImageListBean item) {
        helper.addOnClickListener(R.id.checkbox);

        ImageView checkboxIndicator = helper.getView(R.id.checkIndicator);
        View barrierView = helper.getView(R.id.barrierView);

        if (item.isChecked()) {
            checkboxIndicator.setImageResource(R.drawable.selected);
            barrierView.setVisibility(View.VISIBLE);
        } else {
            checkboxIndicator.setImageResource(R.drawable.unselected);
            barrierView.setVisibility(View.INVISIBLE);
        }

        ImageView imageView = helper.getView(R.id.img);
        Glide.with(mContext).load(item.getFilePath()).into(imageView);
    }
}
