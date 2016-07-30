---
title: LeetCode-165. Compare Version Numbers
date: 2016-07-30 21:44:51
tags:
---

### 165. Compare Version Numbers

Compare two version numbers version1 and version2.

If version1 > version2 return 1, if version1 < version2 return -1, otherwise return 0.

You may assume that the version strings are non-empty and contain only digits and the . character.

The `.` character does not represent a decimal point and is used to separate number sequences.

For instance, `2.5` is not "two and a half" or "half way to version three", it is the fifth second-level revision of the second first-level revision.

Here is an example of version numbers ordering:

```
0.1 < 1.1 < 1.2 < 13.37
```

### 题目翻译

比较两个版本数字 version1 和 version2 。

假如 version1 > version2，返回1；假如 version1 < version2，返回－1；否则，返回0。

你可以假设版本字符串都是非空的，并且只包含数字和 `.` 字符串。

`.` 字符不代表一个小数点，用于分隔数字序列。

例如，`2.5` 不是 `两个半` 或 `第三个版本还差半个版本` 的方式，这是第二个一级修正版本的五个二级修订版本。

这里是版本号顺序的一个例子：

```
0.1 < 1.1 < 1.2 < 13.37
```

### 解题思路

很显而易见的，应该将两个版本字符串使用 `.` 分隔为字符串数组。之后再去一一对相应的数字大小。

需要注意的是需要将一些情况考虑完全：

**1. 分隔得到的字符数组的元素个数不一定相等，例如版本字符串 `1.1` 和 `2.1.2`**
**2. 版本字符最后面的0和去掉0大小一样，例如版本字符串 `1.1` 和 `1.1.0` 大小一样**
**3. 版本字符串中可能包含多个0，例如 `1.00.1`，此时应当作为 `1.0.1` 处理 **

仔细考虑清楚上面的隐含条件之后，代码写起来就没有多大难度了，详细代码如下所示：

### AC Code

```javascript
func compareVersion(version1: String, _ version2: String) -> Int
{
	// 将版本字符串使用 . 分隔成字符串数组 
    var versionArr1 = version1.componentsSeparatedByString(".")
    var versionArr2 = version2.componentsSeparatedByString(".")
    
    let end = versionArr1.count < versionArr2.count ? versionArr1.count : versionArr2.count
    
    for i in 0..<end
    {
        let num1 = Int(versionArr1[i])
        let num2 = Int(versionArr2[i])
        
        if num1 > num2
        {
            return 1
        }
        else if num1 < num2
        {
            return -1
        }
    }
    
    if versionArr1.count > versionArr2.count
    {
        for i in versionArr2.count..<versionArr1.count
        {
            if Int(versionArr1[i]) != 0
            {
                return 1
            }
        }
        return 0
    }
    else if versionArr1.count == versionArr2.count
    {
        return 0
    }
    else
    {
        for i in versionArr1.count..<versionArr2.count
        {
            if Int(versionArr2[i]) != 0
            {
                return -1
            }
        }
        return 0
    }
}
```