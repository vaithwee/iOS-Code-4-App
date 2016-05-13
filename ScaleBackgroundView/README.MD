
###仿淘宝选择规格

####实现思路
　　对于这个效果，主要需要的是对底部的视图进行缩放。对此，我们获取到当前`Window`的`RootViewController`,然后对其的`View`进行两步动画步骤。第一部分，稍微旋转`View`的`x`轴，并对其的进行缩放。第二部分，对`View`的旋转取消，并进一步进行缩放，上移`View`，然后`pop`出我们需要的视图，本代码中只是做了动画部分的实现，至于`pop`出来的视图，可以自己去完善。

####代码实现

第一部分动画
```objectivec
//MARK: 获取第一次转换
    func getFirstTransform() -> CATransform3D
    {
        var transform = CATransform3DIdentity;
        transform.m34 = 1.0 / -900.0;//这样设置才会有3D的效果
        transform = CATransform3DScale(transform, 0.95, 0.95, 1);//缩放
        transform = CATransform3DRotate(transform, CGFloat(15.0*M_PI/180.0), 1, 0, 0);//x轴旋转
        transform = CATransform3DTranslate(transform, 0, 0, -100.0)//移动
        return transform;
    }
```

第二部分动画


```objectivec
//MARK: 获取第二次转换
    func getSecondTransform() -> CATransform3D
    {
        var transform = CATransform3DIdentity;
        transform.m34 = self.getFirstTransform().m34;
        transform = CATransform3DTranslate(transform, 0, self.view.frame.size.height * -0.08, 0);
        transform = CATransform3DScale(transform, 0.8, 0.8, 1.0);
        return transform;
    }
```

####最终效果
![enter image description here](https://raw.githubusercontent.com/vaithwee/iOS-Code-4-App/master/ScreenShots/ScaleBackgroundAndPopView.gif)

