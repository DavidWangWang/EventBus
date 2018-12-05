# EventBus
自定义通知中心不需要手动移除
添加为监听者,利用NSObject关联对象会在NSObject delloc的时候移除。
