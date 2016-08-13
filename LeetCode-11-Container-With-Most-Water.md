---
title: LeetCode-11. Container With Most Water  
date: 2016-08-13 09:04:05  
categories: Algorithm  
tags: LeetCode   
---

## 11. Container With Most Water  

Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

Note: You may not slant the container.

## Translation

给定 n 个非负整数 `a1, a2, …, an` , 每个非负整数代表坐标系(i，ai)中的一个点。将两个端点(i，ai)和(i，0)连接起来形成 n 条垂直的线。找到两条线，这两条线与 x 轴一起组成一个容器，使得容器里包含的水最多。

## The idea of solving process

查看了讨论区中的解答之后，发现了一种非常巧妙的贪心策略。**从两端不断逼近的过程。**  
初始状态，下标变量 `i = 0` 表示头部，下标变量 `j = height.size()`，表示尾部。那么显然此时的容器的装水量取决一个矩形的大小，这个矩形的长度为 `j-i`，高度为 height[i]与height[j]的最小值(假设height[i]小于height[j])。  
接下来考虑的就是把头部下标 i 向右移动还是把尾部下标 j 向左移动呢？如果移动尾部变量j，那么就算 height[j] 变高了，装水量依然没有变得更大，因为短板在头部变量 i。所以应该移动头部变量i。也就是说，**每次移动头部变量 i 和尾部变量 j 中的一个，哪个变量的高度小，就把这个变量向中心移动。计算此时的装水量并且和最大装水量的当前值做比较。**

理解思路之后，写代码就非常简单了，完整代码如下所示：

## AC Code

```swift
func maxArea(height: [Int]) -> Int
{
    if height.count < 2
    {
        return 0
    }
    if height.count == 2
    {
        return min(height[0], height[1])
    }
    
    var left = 0
    var right = height.count - 1
    var ans = min(height[left], height[right]) * (right - left)
    
    while left < right
    {
        if height[left] < height[right]
        {
            left += 1
        }
        else
        {
            right -= 1
        }
        let newAns = min(height[left], height[right]) * (right - left)
        if newAns > ans
        {
            ans = newAns
        }
    }
    
    return ans
}
```