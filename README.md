# flutter_douban

一个仿豆瓣的客户端，按照现在的豆瓣客户端来仿照制作的一个app，
界面美观，同时在页面切换，骨架屏等等方面，均有美观动画，有良好的使用体验

## 涵盖的功能：
- 基本的UI，结构，交互效果等
- 漂亮的动画加载骨架屏
- 双平台都有仿iOS页面的交错动画以及左滑返回手势效果
- 下拉刷新，上拉加载
- 有扫二维码功能（二维码页面背景属于自绘UI） 
- 电影详情预告片可以进行视频播放，并且有常见的视频页面交互
- 图片选择
- 图片拍照以及获取拍照后的图片
- 自定义的仿微信拍照界面
- 有二维码生成功能
- 自定义UI（电影详情中的底部抽屉）
- 两种状态管理（电影详情页是利用[provider](https://pub.dev/packages/provider)，其余的页面有一部分使用的是[fish_redux](https://pub.dev/packages/fish_redux)进行状态管理）
- 可选择用真实网络API的数据还是用本地的模拟数据
- 图片预览，拖拽返回

### [安卓端apk点击这里下载](https://github.com/luckysmg/flutter_douban/raw/master/app-release.apk)


## 截图
- 下面分别是这些截图的链接，如果图片加载不出来可以自行点击查看
[书影音页面](http://m.qpic.cn/psb?/V14ZW7Fv20HeHr/vuAA5r4gyrSCA*UPFw.oDTqNYjWSSXFJDL1F3Vg9M0k!/b/dL4AAAAAAAAA&bo=EAMSBhADEgYDCSw!&rf=viewer_4)
[电影详情页](http://m.qpic.cn/psb?/V14ZW7Fv20HeHr/Wxlnjk3DHNwHjnXa*7LjnKNPZFEPqa4hsqfIMbpVJm0!/b/dLgAAAAAAAAA&bo=EAMSBhADEgYRCT4!&rf=viewer_4)
[电影详情抽屉](http://m.qpic.cn/psb?/V14ZW7Fv20HeHr/mMAsEyy5tndSdEkUvPdQbdUjLmYKoeVc.cs54CMn1F0!/b/dFQBAAAAAAAA&bo=EAMSBhADEgYRCT4!&rf=viewer_4)
[首页](http://m.qpic.cn/psb?/V14ZW7Fv20HeHr/2ZjUM52pr3zZEvGSYjEwDYsZdStCA4yY52tNanpGUXs!/b/dL8AAAAAAAAA&bo=EAMSBhADEgYRCT4!&rf=viewer_4)
[口碑榜单](http://m.qpic.cn/psb?/V14ZW7Fv20HeHr/R96XJBEM5cOEtg0vfr.WUH4lfpxBtiw83Otm5hYgw00!/b/dLYAAAAAAAAA&bo=EAMSBhADEgYRCT4!&rf=viewer_4)
[演员详情](http://m.qpic.cn/psb?/V14ZW7Fv20HeHr/2H.NV1wxZCNbn*CPWWlo84lEGgGQmoouY9L8v162fSg!/b/dLgAAAAAAAAA&bo=EAMSBhADEgYRCT4!&rf=viewer_4)
[Top250](http://m.qpic.cn/psb?/V14ZW7Fv20HeHr/fFOqa8QWViRAL.57rYewG*7u5snuVWULvS5yZo0Z*WU!/b/dFQBAAAAAAAA&bo=EAMSBhADEgYRCT4!&rf=viewer_4)
[瀑布流列表](http://m.qpic.cn/psb?/V14ZW7Fv20HeHr/.LOOewhRgb2lMgqeFbaXLjxEdvhmm0a8tCrJ3dYvUWE!/b/dLYAAAAAAAAA&bo=rANGBwAAAAADB8w!&rf=viewer_4)


![image](http://a3.qpic.cn/psb?/V14ZW7Fv20HeHr/vuAA5r4gyrSCA*UPFw.oDTqNYjWSSXFJDL1F3Vg9M0k!/m/dL4AAAAAAAAAnull&bo=EAMSBhADEgYDCSw!&rf=photolist&t=5)
![image](http://a1.qpic.cn/psb?/V14ZW7Fv20HeHr/Wxlnjk3DHNwHjnXa*7LjnKNPZFEPqa4hsqfIMbpVJm0!/m/dLgAAAAAAAAAnull&bo=EAMSBhADEgYRCT4!&rf=photolist&t=5)
![image](http://a1.qpic.cn/psb?/V14ZW7Fv20HeHr/mMAsEyy5tndSdEkUvPdQbdUjLmYKoeVc.cs54CMn1F0!/m/dFQBAAAAAAAAnull&bo=EAMSBhADEgYRCT4!&rf=photolist&t=5)
![image](http://a4.qpic.cn/psb?/V14ZW7Fv20HeHr/2ZjUM52pr3zZEvGSYjEwDYsZdStCA4yY52tNanpGUXs!/m/dL8AAAAAAAAAnull&bo=EAMSBhADEgYRCT4!&rf=photolist&t=5)
![image](http://a3.qpic.cn/psb?/V14ZW7Fv20HeHr/R96XJBEM5cOEtg0vfr.WUH4lfpxBtiw83Otm5hYgw00!/m/dLYAAAAAAAAAnull&bo=EAMSBhADEgYRCT4!&rf=photolist&t=5)
![image](http://a1.qpic.cn/psb?/V14ZW7Fv20HeHr/2H.NV1wxZCNbn*CPWWlo84lEGgGQmoouY9L8v162fSg!/m/dLgAAAAAAAAAnull&bo=EAMSBhADEgYRCT4!&rf=photolist&t=5)
![image](http://a1.qpic.cn/psb?/V14ZW7Fv20HeHr/fFOqa8QWViRAL.57rYewG*7u5snuVWULvS5yZo0Z*WU!/m/dFQBAAAAAAAAnull&bo=EAMSBhADEgYRCT4!&rf=photolist&t=5)
![image](http://a3.qpic.cn/psb?/V14ZW7Fv20HeHr/.LOOewhRgb2lMgqeFbaXLjxEdvhmm0a8tCrJ3dYvUWE!/m/dLYAAAAAAAAAnull&bo=rANGBwAAAAADB8w!&rf=photolist&t=5)

