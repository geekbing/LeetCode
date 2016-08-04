---
title: LeetCode-198. House Robber  
date: 2016-08-04 17:24:19  
categories: Algorithm  
tags: LeetCode  
---

## 198. House Robber  

You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and **it will automatically contact the police if two adjacent houses were broken into on the same night.**

Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight **without alerting the police.**

## Translation

你是一个专业的小偷，打算沿着街掠夺房子。每个房子都存放有一定数量的钱，相邻房屋的安全系统连接在一起，这是唯一能约束你抢劫他们的限制。**如果两个相邻的房子当晚被闯入，安全系统会自动联系警察。**

给定一个非负整数列表代表每个房子里存放的钱，确定你今晚可以抢劫的最大数量，并且**没有触动警察**。

## The idea of solving process

使用变量 `nodeI_2` 保存如果只有 `i－2` 个节点你所能抢到的最大钱数。
使用变量 `nodeI_1` 保存如果只有 `i－1` 个节点你所能抢到的最大钱数。
使用变量 `nodeI`   保存如果只有 `i`   个节点你所能抢到的最大钱数。  
则，初始状态下：

```swift
var nodeI_2 = nums[0]
var nodeI_1 = max(nums[0], nums[1])
var nodeI = max(nums[0] + nums[2], nums[1])
```

对于第 `i` 个节点，你有两个选择，抢或者不抢：

1. 如果抢第 `i` 个节点，则你最多能获得 `nodeI_2 ＋ nums[i]`
2. 如果不抢第 `i` 个节点，则你最多能获得 `nodeI_1`

故 `nodeI = max(nodeI_2 + nums[i], nodeI_1)`

为下一次循环做准备：

```swift
nodeI_2 = nodeI_1
nodeI_1 = nodeI
```
完整代码如下所示：

## AC Code

```swift
func rob(nums: [Int]) -> Int
{
    if nums.count == 0
    {
        return 0
    }
    if nums.count == 1
    {
        return nums[0]
    }
    if nums.count == 2
    {
        return max(nums[0], nums[1])
    }
    
    var nodeI_2 = nums[0]
    var nodeI_1 = max(nums[0], nums[1])
    var nodeI = max(nums[0] + nums[2], nums[1])
    
    for i in 2..<nums.count
    {
        // 要么抢劫第i个，要么不抢第i个
        nodeI = max(nodeI_2 + nums[i], nodeI_1)
        nodeI_2 = nodeI_1
        nodeI_1 = nodeI
    }
    
    return nodeI
}
```