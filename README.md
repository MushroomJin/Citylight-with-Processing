# Citylight-with-Processing
A processing course practice work

citylight程序

旨在通过简单的点线组合模拟俯瞰视角下的城市光影。

通过代表人口聚集区的固定点位类型city、代表主干道的固定
线型类型road和代表车辆等其他光影的移动点位类型car，尝
试再现夜间俯瞰城市的灯光地图。

程序首先围绕画面中心固定city点，不断围绕已有的city点在
绕其圆环区域内随机生成新的随机city点。同时，在city点之
间随机选取组合建立连线road。最后，随机选择road生成移
动的car点位。

通过将player变量链接新的city、road、car的生成概率，各
单元透明度降低的速度以及car点的移动速度，实现使用滑槽
控制整体画面变化速度。
