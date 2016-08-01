---
title: LeetCode-118. Pascal's Triangle  
date: 2016-08-01 15:39:42  
categories: Algorithm  
tags: LeetCode  
---

### 118. Pascal's Triangle  

Given numRows, generate the first numRows of Pascal's triangle.

For example, given numRows = 5,   
Return

```
[
     [1],
    [1,1],
   [1,2,1],
  [1,3,3,1],
 [1,4,6,4,1]
]
```

### Translation

给定正整数 numRows，生成帕斯卡三角形（即[杨辉三角](http://baike.baidu.com/link?url=i63wvywRTdbTs8NtpeaUbSzLxLXXmWaKCQW3bLAvM_QpbiX3Z46BhA1ZxFLFOor0EU2FJzvaN2w_xFiakmeMr4aRpQPaWNxVtzITN6w1G_Aev82Bp7Fpn1PhDPgcw3gLlblIYcmd2m0COtZaDUG1Hq)）的前 numRows 行。

例如, 给定 numRows = 5,   
返回  

```
[
     [1],
    [1,1],
   [1,2,1],
  [1,3,3,1],
 [1,4,6,4,1]
]
```

### The idea of solving process

非常常规的双重循环问题。使用二维数组来存储生成的帕斯卡三角形。

每一行的元素都是由上一行的元素生成的。令 第 n 行的数组为 arrN，第 n + 1 行的数组为 arrL

则 arrL 的第 m 个元素为 `arrL(m) = arrN(m － 1) ＋ arrN(m)`

同时需要注意：**每一行元素的首尾元素都是1**

清楚规则之后，写代码就不难了。完整代码如下所示：

### AC Code

```javascript
func generate(numRows: Int) -> [[Int]]
{
    if numRows == 0
    {
        return []
    }
    if numRows == 1
    {
        return [[1]]
    }
    if numRows == 2
    {
        return [[1], [1, 1]]
    }
    
    var ans = [[Int]]()
    ans.append([1])
    ans.append([1, 1])
    for i in 2..<numRows
    {
        var arr = [1]
        for j in 1..<i
        {
            arr.append(ans[i - 1][j - 1] + ans[i - 1][j])
        }
        arr.append(1)
        ans.append(arr)
    }
    
    return ans
}
```