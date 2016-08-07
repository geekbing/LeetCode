---
title: LeetCode-136. Single Number  
date: 2016-08-07 09:09:48  
categories: Algorithm  
tags: LeetCode  
---

## 136. Single Number  

Given an array of integers, every element appears twice except for one. Find that single one.

**Note:** 
Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

## Translation

给定一个整数数组，除了一个特殊的元素除外，数组中其他元素出现两次。找到这个特殊的元素。  
**注意：**  
你的算法应该有一个线性的运行复杂度（即时间复杂度为O(n)）。你能实现而不用额外的内存空间吗？

## The idea of solving process

如果采用字典来存储每个元素的种类和个数来解决这题是非常简单的，但是题目提示可以不使用额外的内存。查看讨论区之后，豁然开朗。使用异或运算来解决。  

下面是异或运算（^）的性质：

1. a ^ b = b ^ a
2. a ^ a = 0
3. 0 ^ a = a
4. a ^ b ^ c = a ^ (b ^ c)

所以对于数组 [a, b, a, c, b]来说，把数组中所有的元素做异或运算，使用上述的性质可以得到：

```
a ^ b ^ a ^ c ^ b = a ^ a ^ b ^ b ^ c = 0 ^ 0 ^ c = c
```

故清楚思路之后，这道题目就非常简单了，完整代码如下所示：

## AC Code

```swift
func singleNumber(nums: [Int]) -> Int
{
    var ans = 0
    for num in nums
    {
        ans ^= num
    }
    return ans
}
```