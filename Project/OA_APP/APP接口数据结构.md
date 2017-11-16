## 一、 公司公告相关接口

#### 1. 公告列表
url: [POST] /api/announcements

请求参数描述:

   字段名     |类型 |参数类型|描述
-------------|----|-------|---
access_token |String|header|令牌
companyId|String|query|公司ID
pagination|Pagination|body|分页

返回字段描述:

字段名     |类型 |描述
-------------|-------|---
id |String|公告ID
title|String|公告标题
time|Date|公告时间
photo|String|公告图片url, 多个路径以英文逗号隔开
content|String|公告内容，暂定最长2000个字符

成功返回实例:

```json
{
    "code": 200,
    "data": {
        "rows": [
            {
                "companyId": 0,
                "content": "这是公告内容",
                "id": "912455162944262145",
                "photo": "公告图片链接",
                "time": 1506380829000,
                "title": "公告标题"
            }
        ],
        "total": 1
    },
    "message": ""
}
```

#### 2. 公告详情

url: [GET] /api/announcementDetail

请求参数描述:

   字段名     |类型 |参数类型|描述
-------------|----|-------|---
access_token |String|header|令牌
announcementId|String|query|公告ID

返回字段描述：

字段名     |类型 |描述
-------------|-------|---
id |String|公告ID
title|String|公告标题
time|Date|公告时间
photo|String|公告图片url, 多个路径以英文逗号隔开
content|String|公告内容，暂定最长2000个字符

成功返回实例:

```json
{
    "code": 200,
    "data": {
        "companyId": 0,
        "content": "这是公告内容",
        "id": "912455162944262145",
        "photo": "公告图片链接",
        "time": 1506380829000,
        "title": "公告标题"
    },
    "message": ""
}
```

#### 3. 新增公告(此接口是后台管理系统接口，开放给app端新增测试数据使用)

url: [POST] /api/addAnnouncement
请求参数描述：

   字段名     |类型 |参数类型|描述
-------------|----|-------|---
access_token |String|header|令牌
announcement|Announcement|body|公告信息，新增不用加id字段

请求body示例:

```json
{
    "companyId": 0,
    "content": "这是公告内容",
    "photo": "公告图片链接",
    "time": "2017-09-25T23:07:09.198Z",
    "title": "公告标题"
}
```

成功返回示例:

```json
{
    "code": 200,
    "message": "",
    "data": 1
}
```

## 二、 部门相关接口

#### 1. 新增部门
url: [POST] /api/addDept
请求参数描述：

   字段名     |类型 |参数类型|描述
-------------|----|-------|---
access_token |String|header|令牌
dept|Dept|body|部门信息，新增不用加id字段

请求示例:

```json
{
  "deptDesc": "研发部描述",
  "deptInfo": "研发部信息",
  "deptLeader": "部门领导ID，必须关联一个app用户ID",
  "deptName": "研发部"
}
```

成功返回示例:

```json
{
    "code": 200,
    "message": "",
    "data": 1
}
```

#### 2. 部门列表
url: [POST] /api/depts

请求参数描述：

字段名     |类型 |参数类型|描述
-------------|----|-------|---
access_token |String|header|令牌
companyId|String|query|公司ID, 暂时先传0，后台还未做关联
pagination|Pagination|body|分页

返回字段描述：

字段名     |类型 |描述
-------------|-------|---
id |String|部门ID
parentId|String|上级部门ID, 暂时没用到
deptName|String|部门名称
deptInfo|String|部门信息
deptDesc|String|部门描述
deptLeader|String|部门领导ID


成功返回示例:

```json
{
    "code": 200,
    "message": "",
    "data": {
        "total": 2,
        "rows": [
            {
                "id": 912332336375525378,
                "parentId": 0,
                "deptName": "研发部",
                "deptInfo": "研发部信息",
                "deptDesc": "研发部描述",
                "deptLeader": 912330285918584834
            },
            {
                "id": 912469842941083650,
                "parentId": 0,
                "deptName": "人事部",
                "deptInfo": "人事部信息",
                "deptDesc": "人事部描述",
                "deptLeader": 912330285918584834
            }
        ]
    }
}
```

#### 3. 部门详情
url: [GET] /api/deptDetail

请求参数描述：

字段名     |类型 |参数类型|描述
-------------|----|-------|---
access_token |String|header|令牌
deptId|String|query|部门ID

返回字段描述：

字段名     |类型 |描述
-------------|-------|---
id |String|部门ID
parentId|String|上级部门ID, 暂时没用到
deptName|String|部门名称
deptInfo|String|部门信息
deptDesc|String|部门描述
deptLeader|String|部门领导ID

成功返回示例:

```json
{
    "code": 200,
    "message": "",
    "data": {
        "id": 912332336375525378,
        "parentId": 0,
        "deptName": "研发部666",
        "deptInfo": "研发部信息666",
        "deptDesc": "研发部描述666",
        "deptLeader": 912330285918584834
    }
}
```

#### 4. 删除部门
url: [GET] /api/deptDetail

请求参数描述：

字段名     |类型 |参数类型|描述
-------------|----|-------|---
access_token |String|header|令牌
deptId|String|query|部门ID

成功返回示例:

```json
{
    "code": 200,
    "message": "",
    "data": 1
}
```

## 三、 个人中心相关接口

#### 1. 个人信息

url: [GET] /api/userDetail

请求参数描述：

字段名     |类型 |参数类型|描述
-------------|----|-------|---
access_token |String|header|令牌
userId|String|query|用户ID, 不填则默认为app登录当前用户

返回字段描述：

字段名     |类型 |描述
-------------|-------|---
id |String|用户ID
area|String|地区
birthday|timestamp|生日
name|String|姓名
openId|String|第三方ID
passwd|String|密码
phone|String|电话
photo|String|头像
sex|int|性别 1-男 2-女
source|String|用户来源
status|int|用户状态
ctime|timestamp|创建时间
utime|timestamp|更新时间

成功返回示例:

```json
{
  "code": 200,
  "data": {
    "area": "",
    "birthday": 1506092517000,
    "ctime": 1506090615000,
    "id": "911239771075334145",
    "name": "",
    "openId": "",
    "passwd": "72A04B360142A8DC1AB7B5EA6F978735BDB6D47926702FED3ECEB3ED",
    "phone": "18565383008",
    "photo": "",
    "sex": 0,
    "source": "0",
    "status": 1,
    "utime": 1506090615000
  },
  "message": ""
}
```

#### 2. 打卡
url: [GET] /api/punchClock

请求参数描述：

字段名     |类型 |参数类型|描述
-------------|----|-------|---
access_token |String|header|令牌
attendance|Attendance|body|打卡信息

请求示例:

```json
{
  "date": "2017-09-26T13:38:20.519Z ---打卡日期",
  "endTime": "2017-09-26T13:38:20.519Z ---规定下班时间",
  "endTimeAddress": "石牌桥 ---外出打卡才需要有",
  "endTimeStatus": 0,
  "realEndTime": "2017-09-26T13:38:20.519Z",
  "realStartTime": "2017-09-26T13:38:20.519Z",
  "startTime": "2017-09-26T13:38:20.519Z",
  "startTimeAddress": "string",
  "startTimeStatus": 0,
  "type": 0
}
```

## 四、 入职相关接口

#### 1. 入职申请
url: [POST] /api/entryApply

请求参数描述：

   字段名     |类型 |参数类型|描述
-------------|----|-------|---
access_token |String|header|令牌
employee|Employee|body|员工信息，新增不用加id字段

请求body描述:

字段名     |类型 |描述
-------------|-------|---
id |String|入职ID
area|String|身份证地址
birthday|timestamp|身份证出生日期
realName|String|真实姓名
bankcardName|String|银行卡开户行名称
bankcardNo|String|银行卡号
deptId|String|部门ID
empNo|String|员工编号
gender|int|性别 1-男 2-女
identification|String|身份证号
material|String|入职材料
mobile|String|手机号
profession|String|职业
status|int|审批状态
time|timestamp|入职申请时间
type|int|入职类型
verifyId|String|审核人ID
verifyTime|timestamp|审核时间

成功返回示例:

```json
{
    "code": 200,
    "message": "",
    "data": 1
}
```

#### 2. 入职申请列表

url: [POST] /api/entryApplies

请求参数描述：

   字段名     |类型 |参数类型|描述
-------------|----|-------|---
access_token |String|header|令牌
type|int|query|1-我申请的 2-我审批的
pagination|Pagination|body|分页

返回参数描述请参考【入职申请】接口

成功返回示例:

```json
{
  "code": 200,
  "data": {
    "rows": [
      {
        "address": "广州市荔湾区",
        "applyId": "912330285918584834",
        "bankcardName": "工商银行",
        "bankcardNo": "222222222222",
        "birthday": 1506469730000,
        "deptId": "912332336375525378",
        "empNo": 111,
        "gender": 1,
        "id": "912827348087341057",
        "identification": "string",
        "material": "string",
        "mobile": "string",
        "profession": "string",
        "realName": "string",
        "status": 1,
        "time": 1506469730000,
        "type": 0,
        "verifyId": "912330285918584834",
        "verifyTime": 1506469730000
      }
    ],
    "total": 1
  },
  "message": ""
}
```

#### 3. 入职申请详情

url: [GET] /api/entryDetail

请求参数描述:

   字段名     |类型 |参数类型|描述
-------------|----|-------|---
access_token |String|header|令牌
entryId|String|query|入职ID

返回参数描述请参考【入职申请】接口

成功返回示例:

```json
{
  "code": 200,
  "data": {
    "address": "string",
    "applyId": "912330285918584834",
    "bankcardName": "string",
    "bankcardNo": "string",
    "birthday": 1506469730000,
    "deptId": "912332336375525378",
    "empNo": 111,
    "gender": 1,
    "id": "912827348087341057",
    "identification": "string",
    "material": "string",
    "mobile": "string",
    "profession": "string",
    "realName": "string",
    "status": 1,
    "time": 1506469730000,
    "type": 0,
    "verifyId": "912330285918584834",
    "verifyTime": 1506469730000
  },
  "message": ""
}
```

## 五、 外出相关接口

#### 1. 外出申请
url: [POST] /api/outsideApply

请求参数描述：

   字段名     |类型 |参数类型|描述
-------------|----|-------|---
access_token |String|header|令牌
outsideInfo|OutsideInfo|body|外出申请信息，新增不用加id字段

请求body描述:

字段名     |类型 |描述
-------------|-------|---
deptId |String|部门ID
endAddress|String|外出目的地
endTime|timestamp|外出结束时间
startAddress|String|外出出发地
startTime|timestamp|外出开始时间
status|String|审核状态
verifyId|String|审核人ID
verifyTime|timestamp|审核时间

成功返回示例:

```json
{
    "code": 200,
    "message": "",
    "data": 1
}
```

#### 2. 外出申请列表

url: [POST] /api/outsides

请求参数描述：

   字段名     |类型 |参数类型|描述
-------------|----|-------|---
access_token |String|header|令牌
type|int|query|1-我申请的 2-我审批的
pagination|Pagination|body|分页

返回参数描述请参考【外出申请】接口

成功返回示例:

```json
{
  "code": 200,
  "data": {
    "rows": [
      {
        "applyId": "912330285918584834",
        "deptId": "912332336375525378",
        "endAddress": "string",
        "endTime": 1506469730000,
        "id": "912834848492756994",
        "startAddress": "string",
        "startTime": 1506469730000,
        "status": 0,
        "verifyId": "912330285918584834",
        "verifyTime": 1506469730000
      }
    ],
    "total": 1
  },
  "message": ""
}
```

#### 3. 外出申请详情

url: [GET] /api/outsideDetail

请求参数描述:

   字段名     |类型 |参数类型|描述
-------------|----|-------|---
access_token |String|header|令牌
outsideId|String|query|外出ID

返回参数描述请参考【外出申请】接口

成功返回示例:

```json
{
  "code": 200,
  "data": {
    "applyId": "912330285918584834",
    "deptId": "912332336375525378",
    "endAddress": "string",
    "endTime": 1506469730000,
    "id": "912834848492756994",
    "startAddress": "string",
    "startTime": 1506469730000,
    "status": 0,
    "verifyId": "912330285918584834",
    "verifyTime": 1506469730000
  },
  "message": ""
}

```
