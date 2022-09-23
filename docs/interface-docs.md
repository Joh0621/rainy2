## 接口文档

请求地址

```
http://ip:port/api/v1/points
```

请求方法

`GET` 

请求参数

| 参数名称  | 类型   | 是否必须 | 描述                                                         |
| --------- | ------ | -------- | ------------------------------------------------------------ |
| codes     | String | 必须     | 数据点码,多个点码用英文逗号隔开,例如,CB1.DAFENG.H91BWD,CB1.DAFENG.H91CWD |
| startTime | String | 必须     | 开始时间，格式为：yyyy-MM-dd HH:mm:ss 例子：2021-01-01 00:00:00 |
| endTime   | String | 必须     | 结束时间，格式为：yyyy-MM-dd HH:mm:ss 例子：2021-01-02 00:00:00 |
|           |        |          |                                                              |

请求示例

```
curl -XGET -H 'Authorization: A0CDC594C90D8009F51F7F5C592B9A94' http://ip:port/api/v1/points?&codes=CB1.DAFENG.H91BWD,CB1.DAFENG.H91CWD&startTime=2021-01-01 00:00:00&endTime=2021-01-02 00:00:00
```

响应示例

```json
{
  "code": 0,
  "success": true,
  "message": "ok",
  "data": {
    "CB1.DAFENG.H91BWD": [
      [
        "2021-01-01T00:00:00Z",
        227.33069
      ],[
        "2021-01-01T00:00:05Z",
        227.33369
      ]
      ...
    ],
    "CB1.DAFENG.H91CWD": [
      [
        "2021-01-01T00:00:00Z",
        -10.4994
      ], [
        "2021-01-01T00:00:05Z",
        -10.4994
      ]
      ...
    ]
  }
}
```
