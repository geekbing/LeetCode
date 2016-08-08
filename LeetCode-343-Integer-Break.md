---
title: LeetCode-343. Integer Break  
date: 2016-08-07 10:49:34  
categories: Algorithm  
tags: LeetCode  
---

## 343. Integer Break  

Given a positive integer n, break it into the sum of **at least** two positive integers and maximize the product of those integers. Return the maximum product you can get.

For example, given n = 2, return 1 (2 = 1 + 1); given n = 10, return 36 (10 = 3 + 3 + 4).

**Note:** You may assume that n is not less than 2 and not larger than 58.

**Hint:**

1. There is a simple O(n) solution to this problem.
2. You may check the breaking results of n ranging from 7 to 10 to discover the regularities.

## Translation

给定一个正整数 n，将它分解成最少两个正整数，它们的和为 n ，最大化它们的乘积。返回你能得到的最大乘积。 

例如，给定 n = 2， 返回 1 (2 = 1 + 1); 给定 n = 10, 返回 36 (10 = 3 + 3 + 4)。  

**注意：** 你可以假设 n 大于等于2，并且 n 不比58大。  

**提示：**

1. 有一个简单的时间复杂度为O(n)的方法来解决这个问题。
2. 你可以检查 n 从7到10的分解结果从而来发现规律。

## The idea of solving process  

从题目提示中，我们来检查一下 n 从4到10的分解结果如下：    
n = 4， 4 ＝ 2 ＋ 2，返回4  
n = 5， 5 ＝ 3 ＋ 2，返回6  
n = 6， 6 ＝ 3 ＋ 3，返回9  
n = 7， 7 ＝ 3 ＋ 2 ＋ 2，返回12  
n = 8， 8 ＝ 3 ＋ 3 ＋ 2，返回18  
n = 9， 9 ＝ 3 ＋ 3 ＋ 3，返回27  
n = 10,10 ＝ 3 ＋ 3 + 2 + 2，返回36  
从上述分解可以看出，将一个数尽量先分解成 3 相加和的形式，  
如果最后剩下4，可以分解成 2 ＋ 2  
如果最后剩下5，可以分解成 3 ＋ 2  
如果最后剩下6，可以分解成 3 ＋ 3  
这样所得到的乘积最大。  

清楚思路之后，写代码便不难了，完整代码如下所示。

## AC Code

```swift
func integerBreak(n: Int) -> Int
{
    if n == 2
    {
        return 1
    }
    if n == 3
    {
        return 2
    }
    // 分解得到的3的个数
    let threeNum = (n - 4) / 3
    // 剩余的整数
    let remainNum = n - threeNum * 3
    if remainNum == 4
    {
        return Int(pow(3.0, Double(threeNum))) * 4
    }
    else if remainNum == 5
    {
        return Int(pow(3.0, Double(threeNum))) * 6
    }
    else
    {
        return Int(pow(3.0, Double(threeNum))) * 9
    }
}
```
