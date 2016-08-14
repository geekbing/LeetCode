---
title: LeetCode-69. Sqrt(x)  
date: 2016-08-14 08:44:07  
categories: Algorithm  
tags: LeetCode   
---

## 69. Sqrt(x)  

Implement `int sqrt(int x)`.

Compute and return the square root of x.

## Translation

实现求开平方根函数 `int sqrt(int x)`。计算并返回 x 的平方根。

## The idea of solving process

非常直接的想法是从 0 一直向后遍历，当 `i * i >= x` 的时候，所求的平方根为 i。但是这种暴力遍历的方式非常的不优雅。代码如最后的方法1所示。

看过别人的解答之后，不由得称赞。利用下面最基本的数学公式


```
sqrt(N) = 2 / 2 ＊ sqrt(N) = 2 ＊ sqrt(1 / 4) ＊ sqrt(N) = 2 ＊ sqrt(N / 4)
```

找到递推关系式之后，就可以将采用递归的方式进行求解。 

但是有一点需要注意的地方就是：对于那些不能被 4 整除的数，例如9、25、49, 实际的结果应该为 `1 + 2 ＊sqrt(N / 4)`，因为我们需要考虑余数。

完整的代码如下所示：

## AC Code

不优雅的暴力搜索方法1：

```swift
func mySqrt(x: Int) -> Int
{
    var i = 0
    while i * i <= x
    {
        i += 1
    }
    return i - 1
}
```

优雅的递归方法2:

```swift
func mySqrt(x: Int) -> Int
{
    if x == 0
    {
        return 0
    }
    if x < 4
    {
        return 1
    }
    let ans = 2 * mySqrt(x / 4)
    if (ans + 1) * (ans + 1) <= x
    {
        return ans + 1
    }
    return ans
}
```