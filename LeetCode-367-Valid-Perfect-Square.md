---
title: LeetCode-367. Valid Perfect Square  
date: 2016-08-11 19:31:10  
categories: Algorithm  
tags: LeetCode   
---

## 367. Valid Perfect Square

Given a positive integer num, write a function which returns True if num is a perfect square else False.

**Note: Do not** use any built-in library function such as `sqrt`.

**Example 1:**

```
Input: 16
Returns: True
```

**Example 2:**

```
Input: 14
Returns: False
```

## Translation

给定一个正整数 num ，写一个函数来判断 num 是不是一个整数的平方。如果是返回 True，否则返回 false。  
**注意：不要** 使用任何的内建的库函数例如 `sqrt`等。  
**例1：**

```
输入: 16
返回: True
```

**例2：**

```
输入: 14
返回: False
```

## The idea of solving process

利用等差级数公式: 

![image](http://diary123.oss-cn-shanghai.aliyuncs.com/20160811/1.png)

这样的话, 从1开始一直将数列的前 n 项加和，直到和大于或等于 num 的时候，根据是否相等可以判断出 num 是不是一个整数的平方。

完整代码如下所示：

## AC Code

```swift
func isPerfectSquare(num: Int) -> Bool
{
    var sum = 0
    var i = 1
    while sum < num
    {
        sum += 2 * i - 1
        i += 1
    }
    if sum == num
    {
        return true
    }
    return false
}
```