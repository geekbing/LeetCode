---
title: LeetCode-55. Jump Game  
date: 2016-08-15 08:20:41  
categories: Algorithm  
tags: LeetCode   
---

## 55. Jump Game  

Given an array of non-negative integers, you are initially positioned at the first index of the array.

Each element in the array represents your maximum jump length at that position.

Determine if you are able to reach the last index.

For example:
A = `[2,3,1,1,4]`, return `true`.

A = `[3,2,1,0,4]`, return `false`.

## Translation

给定一个非负整数数组，你最初在数组的开头。数组中每个元素代表你在那个位置能够跳的最大长度。确定你是否能够达到数组的末尾。  
例如：  
给定 A = `[2,3,1,1,4]`, 返回 `true`。
给定 A = `[3,2,1,0,4]`, 返回 `false`。

## The idea of solving process

从头到尾遍历数组，使用一个变量 `maxReach` 来记录当前你所能到达的的最远距离。  
如果当前位置 i 小于 `maxReach` 并且当前位置加上当前能够跳的步数 `nums[i]` 超过了 `maxReach`，则更新 `maxReach` 的值。  
同时判断新的值是否能够到达数组末尾。主要思路如下所示：

```swift
for i in 0..<nums.count
{
	if i <= maxReach && i + nums[i] > maxReach
	{
		maxReach = i + nums[i]
	}
	if maxReach >= nums.count - 1
	{
		return true
	}
}
```

完整代码如下所示：

## AC Code

```swift
func canJump(nums: [Int]) -> Bool
{
    if nums.count == 1
    {
        return true
    }
    var maxReach = nums[0]
    
    for i in 0..<nums.count
    {
        if i <= maxReach && i + nums[i] > maxReach
        {
            maxReach = i + nums[i]
        }
        if maxReach >= nums.count - 1
        {
            return true
        }
    }
    return false
}
```