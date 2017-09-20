---
标题: "青少年健康平台"
撰写人: "陈建业"
日期: "2017-03-21 21:43"
---

#### 一、目的
  随着工程越来越多，为了方便团队成员查找项目及相关信息，最终将接口调用和浏览器访问的地址整理出来供大家参考。

#### 二、青少年健康平台前端工程访问后台服务信息

#### 1、API接口访问信息
| 项目名称 |          github项目名称         |      IP       | API端口  |
| ------- | ----------------------------- | ------------  | ------- |
| 运营后台| smartsport-management-frontend | 120.77.48.80  |  3000  |
| 专家后台 | smartsport-expert-frontend     | 120.77.48.80  |  3001  |
| 学校后台 | smartsport-school-frontend     | 120.77.48.80  |  3002  |
| 教育机构后台 | smartsport-gov-agency-frontend | 120.77.48.80  |  3003  |

#### 2、本地访问信息
| 项目名称 |          github项目名称         |      IP       | API端口  |
| ------- | ----------------------------- | ------------  | ------- |
| 运营后台| smartsport-management-frontend | localhost  |  3000  |
| 专家后台 | smartsport-expert-frontend     | localhost  |  3001  |
| 学校后台 | smartsport-school-frontend     | localhost  |  3002  |
| 教育机构后台 | smartsport-gov-agency-frontend | localhost  |  3004  |

**通过工程根目录下的server目录中的server.js文件中查看到接口调用的真实url，可以打印出来，每次调用后台接口控制台就会打印出一条url记录，代码如下： **

```javascript
app.use('/proxy', (req, res) => {
  if ( config.isVirtual && analogData(req, res)) {
    return;
  }
  const url = targetUrl + req.url;
  console.log('url ==== ', url);
  req.pipe(request(url)).pipe(res);
});
```

#### 2、浏览器同时访问多个后台
**在开发过程中有时候涉及到两个甚至多个后台的任务，这种情况下为了避免重启node，可以启动多个node服务，但是由于端口冲突所以需要修改node的服务的端口。例如: 同时访问运营端和学校端步骤 **
* 启动运营端(访问端口是3000, node监听的端口是3001)
  ```bash
  npm run dev
  ```
* 修改学校后台端口


###### 移动端(待修改)
| 项目名称 |          github项目名称         |      IP       |   端口  |
| ------- | ----------------------------- | ------------  | ------- |
| 运营后台 | smartsport-management-frontend | 120.77.48.80  |  3000  |
| 专家后台 | smartsport-expert-frontend | 120.77.48.80  |  3001  |
| 学校后台 | smartsport-school-frontend | 120.77.48.80  |  3002  |
| 教育机构后台 | smartsport-gov-agency-frontend | 120.77.48.80  |  3003  |


#### 三、苹果帐号信息

>问题：

>你学会做的第一道菜？炒鸡蛋

>你的理想工作？产品经理

>你去过的第一个海滨浴场？三亚湾

>IOS帐号
support@paymentwall.com
qiye.aliyun.com
yy@qsntzjk.cn
Aa0987654321

>yy@qsntzjk.cn

>Aa0987654321

>应用宝/QQ

>QQ:2247983935

>+8613719031190

>dodoliang@139.com

>2247983935@qq.com

>密码：Aa0987654321

#### 四、App上架信息

##### 学生端App
|公司名称|bundleID|APP名称|
| :--: | :--: | :--:  |
|广东原动力信息科技有限责任公司|com.qsntzjk.student|校体通学生版|

##### 家长端App
|公司名称|bundleID|APP名称|
| :--: | :--: | :--:  |
|广东原动力信息科技有限责任公司|com.qsntzjk.parent|校体通家长版|

##### 老师端App
|公司名称|bundleID|APP名称|
| :--: | :--: | :--:  |
|广东原动力信息科技有限责任公司|com.qsntzjk.school|校体通教师版|

##### 领导端App
|公司名称|bundleID|APP名称|
| :--: | :--: | :--:  |
|广东原动力信息科技有限责任公司|com.qsntzjk.gov|校体通大数据版|



#### 测试服务器帐号密码
帐号：root@112.74.12.182
密码：Xunyijia@2017

#### 生产服务器帐号密码
帐号：root@120.77.157.8
密码：Zhihuitiyu8@fe1
