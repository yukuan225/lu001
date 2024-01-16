# 陆向谦实验室AI-APP

A new Flutter project.

## 相关工具及网站

tree /f /a > dirTree.txt    # > dirTree.txt 表示把生成的目录树保存到dirTree.txt中

无线调试app

1. adb tcpip 5555
2. adb connect 192.168.0.100

[无线调试文档参考](https://developer.android.google.cn/studio/command-line/adb?hl=zh-cn)

[在线测试音频文件](https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3)

[在线测试视频文件](https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4)

[WebSocket测试网址](http://wstool.js.org/)

[图标工场 - 移动应用图标/启动图生成工具](https://icon.wuruihong.com/)

[插件整理合集](https://fluttergems.dev/)

[测试接口ws://49.234.18.41:8866](ws://49.234.18.41:8866)

[Json转Dart类](https://app.quicktype.io/)
[JSON to Dart (javiercbk.github.io)](https://javiercbk.github.io/json_to_dart/)

[JSON格式化工具](https://doudoudzj.github.io/html-tools/jsoneditor/v2/)

[图标工场 - 移动应用图标/启动图生成工具，一键生成所有尺寸的应用图标/启动图 (wuruihong.com)](https://icon.wuruihong.com/)

[CODELF (unbug.github.io)](https://unbug.github.io/codelf/)

[Free Lottie Animation Files,(动画文件搜索平台)](https://lottiefiles.com/)

[Flutter Icons 内置图标库 - 简书 (jianshu.com)](https://www.jianshu.com/p/1c19d8685)

[Flutter Icon 图标网](https://www.fluttericon.cn/)

[Flutter应用打包发布 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/301032801)

## 产品文档

实验室APP产品PRD需求文档

文档需求说明书

## 一  摘要

说明：<简单描述项目的背景、意义、目的、目标等，描述领域知识>

项目参考文档：[https://drive.weixin.qq.com/s?k=AFAAtgeQAA43EkjB1u](https://drive.weixin.qq.com/s?k=AFAAtgeQAA43EkjB1u)

### 1.文档历史记录

注：后期所加内容均绿色背景字体标注

| **编号** | **日期** | **版本** | **描述**           | **作者** | **审阅者** |
| -------------- | -------------- | -------------- | ------------------------ | -------------- | ---------------- |
| 1              | 2021.2.9       | 1.0            | 描述APP语音部分需求      | 叶俊           |                  |
| 2              | 2021.5.3       | 2.0            | 增加智能推送部分需求     | 叶俊           |                  |
| 3              | 2021.5.4       | 3.0            | 构架整理；补全，细化文档 | 杨仕明         |                  |
| 4              | 2021.0815      | 4.0            |                          | 杨仕明         |                  |

### 2.产品介绍

陆向谦实验室APP是清华陆向谦创新创业实验室技术人员开发的一款app，为在校大学生，初入职场人群提供创新创业学习和就业创业实操的软件！

用户可以通过这款软件，学习相关的理知识,

### 3.产品定位

该app是一个帮助在校大学生，初入职场人群，在职人员及其部分创业者走向成功，实现自我价值！

产品定位为：

Slogan ：每个学员都有属于自己的路！

产品的特点：

* 智能推送指定新闻内容
* 补全和联结实验室产品残缺部分（优化报名流程，完善课程体系，提升用户体验），确保有需求。
* 采用语音交互技术，让交互变得更加便捷。
* 。。。

## 4.产品设计思考

## 5.风险说明

| **风险** | **风险场景** | **描述** | **监控策略** | **改善策略** |
| -------------- | ------------------ | -------------- | ------------------ | ------------------ |
|                |                    |                |                    |                    |
|                |                    |                |                    |                    |
|                |                    |                |                    |                    |

## 6.名词解释

<定义系统中的词汇，解释词汇含义，整个文档统一词汇名称>

功勋学员

骨干学员

## 7.模块总述

### **智能推送（抓取）模块**

在这个信息爆炸的时代，各类app为了涉猎用户生活的方方面面，将用户不感兴趣的内容推送给用户，浪费了用户大量的时间和精力，另外，对自己职业发展有明确规划的用户，必然会关注创新创业领域的实时资讯。这类用户需要一款根据用户关注的领域，推送优质内容的产品；**这一版可以做的很小，比如只抓取极客公园的微信公众号或者网页的文章内容在App中显示推送。**

### **社区模块**

### **课程模块**

* 内部课程

将往期理论课程，大咖会谈等视频迁移到app中作为课程的一部分。

学员说

理论课程

大咖会谈

精彩例会

往期课程

* 外部课程

针对当下的市场形式，市场人才需求引入特定的课程，辅助学员更快的成长。

### **支付模块**

* 初期以实现训练营及其会员的资费

### **语音模块**

1. 基于AI语音问答查经，接入百度知识问答接口（基于数据对用户需求进行深层次、知识化理解，并结合知识查询、推理、计算等多种技术，精准满足用户需求。为用户提供多领域、细粒度的知识问答服务[https://ai.baidu.com/ai-doc/KG/6k8dhe8b5](https://ai.baidu.com/ai-doc/KG/6k8dhe8b5)），针对以下用户场景：对实验室新生答疑的常见问题的录入和解答、实验室资料的查找和地址索引、实验室功勋成员的语音介绍。

２. 用户每天有很多碎片化时间，比如在路上行走、乘载交通工具出行，而又不方便拿出手机细细阅读，因此我们认为需要利用语音交互的AI技术，让用户解放双手双眼，利用语音控制APP，并将新闻“读”出来，例如极客公园新闻内容。

### 会员系统

认证体系

构建一套能够让学员从普通成员成长为功勋学员的成长体系！

### 8.领域知识

**技术方案**

● Google Flutter - 同时支持安卓、iOS、移动网页、桌面网页的前端框架

● Eggjs+MongoDB+GraphQL - 后端

● Github - 代码协作，项目管理

**语音模块部分：**

组件化的架构思想；

在线语音合成、本地语音唤醒（调用第三方sdk)

在线语义理解（调用第三方sdk)

根据应用相关内容的语义理解

**智能推送部分：**

指定新闻内容机器抓取；

文章接口编程；

## 二 需求分析

### 1.需求背景

实验室AI智能语音APP项目，从项目成型级别，逐步向商用级别过渡!

![](https://fpqzjqhvqj.feishu.cn/space/api/box/stream/download/asynccode/?code=NjMxOGU4MjhiN2QxYzVmN2RmMjdiNDY1NjU5NDE2YTNfZVZFYmxNbEhtZThSU2FlbGJ2VkJKM0N3S1JBb1B6VFFfVG9rZW46Ym94Y240Mkx3a2s4amR4ZmFWSm1JWWRRdDNjXzE2NDA1NTE5NjM6MTY0MDU1NTU2M19WNA)

### 2.市场背景

#### 市场规模

中国职业教育市场近年来保持**12%的增长率快速发展，2020年市场规模将突破6000亿**，非学历职业教育突破**4000亿**

![](https://fpqzjqhvqj.feishu.cn/space/api/box/stream/download/asynccode/?code=OTBjMDVkNjFiNWYxNTllMDkyYTVjZTU4OWI1MGYyM2JfMWpORzlXbHNLQnRVbGZzc2loam82eTdjc0s3ZXF6VFJfVG9rZW46Ym94Y25GN2NPaml5YmdrRXhBQmxrQlVvcE42XzE2NDA1NTE5NjM6MTY0MDU1NTU2M19WNA)

#### 目标用户

陆向谦创新创业实验室典型用户群体！

* **在校学生**

随着高校扩招，拥有高学历的群体越来越庞大，而大多数毕业生面临在校学习的理论知识与社会需要出现了断层的现象。如何使学生在毕业时缩短理论与实践的距离，是一个重要问题!

* **初入职****场人群**

2018年中国高校毕业生的数量达到820万，但是于此同时带来的则是众多学生初入社会时的迷茫。毕业生不仅面临着知识与实践的差距，更多的则是缺乏对未来准确的定位与明确的职业规划!

* **在职人员**

随着经济大环境变化及产业调整，这一群体不得不面临“不学习就要被淘汰”的窘境。与此同时，以80后为主体的这一代在职人员自身学习愿望强烈，对现状的满足度较低!

#### 人群特性

对工作环境感到恐慌

选择“动态职业”

自主学习欲望强

愿意终身学习

与所学专业不匹配

找不到合适自己的工作

不明确发展方向

## 市场动态

![](https://fpqzjqhvqj.feishu.cn/space/api/box/stream/download/asynccode/?code=YjIwNWYyYTBmNzA0OWZhYzkwYjk3OTRjNWU0NjQ1YTNfbGZoYXVVeDFFblZKUmh3dldrS3Q3OWptM09nWFdWdXFfVG9rZW46Ym94Y25raWpGeHBQU1REZDRtZDRyMjhQbnZnXzE2NDA1NTE5NjM6MTY0MDU1NTU2M19WNA)

## 行业动态

### 3.需求整理

[用户画像分析](https://fpqzjqhvqj.feishu.cn/sheets/shtcnFRcB5Xpjz4ch3tKtMfrcRd)

# 三 产品结构

### 1.产品结构图

产品结构图：主要是辅助设计和技术开发人员了解产品的全局结构，他和用户流程图不一样，产品结构图只是罗列出产品的频道和页面。

**无法复制加载中的内容**

### 2.产品信息结构图

信息结构图：主要是辅助服务端技术人员创建或调整数据结构的参考文件

* 信息结构以信息为维度，比如用户信息，用户文章信息，用户行为信息等，与产品结构可对应分析，不再陈述。

**无法复制加载中的内容**

## 3.产品功能结构图

## 4.信息结构表

| **功能模块** | **字段名称** | **数字** | **位数控制** | **数据区间** | **默认键盘** | **备注** |
| ------------------ | ------------------ | -------------- | ------------------ | ------------------ | ------------------ | -------------- |
|                    |                    |                |                    |                    |                    |                |
|                    |                    |                |                    |                    |                    |                |
|                    |                    |                |                    |                    |                    |                |
|                    |                    |                |                    |                    |                    |                |

### 5.接口清单

| **序号** | **接口** | **接口详述** |
| -------------- | -------------- | ------------------ |
|                |                |                    |
|                |                |                    |
|                |                |                    |

## 四 全局说明

### 1.数据权限

* 分为登录/未登录状态；
* 未登录用户以游客的身份进入，只可以浏览。。。，不可以做关注、评论、转发、购买商品等其他操作。
* 登录后，用户可进行APP内所有的操作。

### 2.键盘交互

* 进行登录操作时，点击 APP 手机号码输入框，由页面底部弹出数字键盘；
* 点击搜索框、评论框、编辑框时⻚面底部弹出字母键盘。

### 3.页面异常

## 五 业务流程

<整个产品涉及各个业务的整个流程图>

## 1.登录/注册流程

该登录注册流程图，包括登录注册的流程梳理以及可能出现的异常处理。

**无法复制加载中的内容**

![](https://fpqzjqhvqj.feishu.cn/space/api/box/stream/download/asynccode/?code=OGY3N2Q2MTViZDVhNDlmMTUyN2ZiOTZmNjIzY2NhNzRfckI4ZlNubDd5QmNqeldET3lZcDRlWEFGUzlkRUxGYU1fVG9rZW46Ym94Y24xREZJdHE0dld0VUppVmdIdW1EbWJoXzE2NDA1NTE5NjM6MTY0MDU1NTU2M19WNA)

### 2.语音交互流程

**无法复制加载中的内容**

**无法复制加载中的内容**

![](https://fpqzjqhvqj.feishu.cn/space/api/box/stream/download/asynccode/?code=YTc1YTYyZmNlNzg1YTlhOWYzZjA2MjQ5NjZiYjM2NTRfanR3TlFuR0ozS0NkcWFVVzRvb2txdHpoRjJNZVBIMEZfVG9rZW46Ym94Y25OS2NJMTRKeFpRYzJxT0lJREduWUFjXzE2NDA1NTE5NjM6MTY0MDU1NTU2M19WNA)

### 3.会员缴费流程

### 4.智能推送流程

### 5.咨询查询流程

#### 社区见面流程

#### 功能说明

<描述功能的作用>

（１.   知识查询，新手进入实验室时，打开APP，咨询问题

（２.   语音播报新闻

#### 用例说明

<编写业务用例，即按照真实的用户业务划分用例，记录人机交互过程，完成用例描述>

用例图

| **<新增实验室成员>** |                |                                |
| -------------------------- | -------------- | ------------------------------ |
| **用例概述**         |                |                                |
| 业务描述                   |                | 新同学加入实验室               |
| 需求描述                   |                | 询问问题以及查找实验室资料索引 |
| 行为者                     |                | 新加入同学                     |
| 前置条件                   |                | 触发问答                       |
| 后置条件                   |                | 输出问答库                     |
| 其他说明                   |                |                                |
| **业务规则**         |                |                                |
| **序号**             | **规则** |                                |
| 1.                         |                |                                |
|                            |                |                                |

用例 2‑1

### 5.相关规则

<描述跟系统实现相关的业务规则>

## 六 界面逻辑

蓝湖项目地址：[学创圈 - 蓝湖 (lanhuapp.com)](https://lanhuapp.com/web/#/item/project/stage?pid=d3188410-e811-4f14-a391-a723d9c2b3ba&image_id=282cbc1e-ce38-4203-93bc-0a535675d0df)

### 1.首页逻辑图

### 2.个人中心逻辑图

### 3.语音唤醒逻辑图

### 4.社区页逻辑图

### 5.课程页逻辑图

## 七 非功能需求

### 1.规则变更需求

可能变更的系统规则

### 2.产品服务需求

产品设计需要提供的附加人为服务

### 3.帮助需求

需要提供的帮助信息

### 4.性能需求

需要提供的安全性信息

### 5.安全性需求

## 八 上线时间安排表

分解项目任务，制定上线时间

## 九 总结
