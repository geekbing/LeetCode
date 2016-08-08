---
title: LeetCode-268. Missing Number  
date: 2016-08-07 11:02:29  
categories: Algorithm  
tags: LeetCode  
---

## 268. Missing Number  

Given an array containing n distinct numbers taken from `0, 1, 2, ..., n`, find the one that is missing from the array.

For example,
Given nums = `[0, 1, 3]` return `2`.

**Note:**
Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?

## Translation

给定一个数组，数组包含 n 个取自 `0, 1, 2, ..., n` 的不同的数字，从数组中找到丢失的那个数字。

例如：给定 nums = `[0, 1, 3]` 返回 `2`.

**注意：**  
你的算法应当使用线性的时间复杂度（即时间复杂度为O(n)）。你能够只使用常量的额外空间来解决这题吗？

## The idea of solving process

从 `0, 1, 2, ..., n` 中取 n 个不同的数字组成数组 nums，寻找丢失的那个数字，非常自然的想法就是将 `0, 1, 2, ..., n` 加和之后，减去数组 nums 的和就得到了丢失的那个数字。

思路非常简单。但是为了避免加和造成的溢出，这里有一个小技巧：**即不需要将两个数组先加起来之后再做减法，可以边加边减。**

代码非常的简单，详细代码如下所示：

## AC Code

```swift
func missingNumber(nums: [Int]) -> Int 
{
	var ans = 0
	for i in 0..<nums.count
	{
		ans = ans + i - nums[i]
	}
	ans += nums.count
	return ans
}
```