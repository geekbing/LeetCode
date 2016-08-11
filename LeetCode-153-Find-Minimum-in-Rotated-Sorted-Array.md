---
title: LeetCode-153. Find Minimum in Rotated Sorted Array  
date: 2016-08-11 18:38:38  
categories: Algorithm  
tags: LeetCode   
---

## 153. Find Minimum in Rotated Sorted Array  

Suppose a sorted array is rotated at some pivot unknown to you beforehand.  
(i.e., `0 1 2 4 5 6 7` might become `4 5 6 7 0 1 2`).  
Find the minimum element.  
You may assume no duplicate exists in the array.

## Translation

假设将一个排好序的数组以某个你不知道的轴旋转。(例如： `0 1 2 4 5 6 7` 可能变成 `4 5 6 7 0 1 2`)。
找到数组中最小的元素。你可以假设数组中不存在重复的元素。

## The idea of solving process

遍历当前数组元素，如果当前元素比它之后的一个元素大，说明这个地方是发生旋转的地方。后一个元素就是最小的元素。  
思路非常简单，完整代码如下所示：

## AC Code

```swift
func findMin(nums: [Int]) -> Int
{
    for i in 0..<nums.count - 1
    {
        if nums[i + 1] < nums[i]
        {
            return nums[i + 1]
        }
    }
    return nums[0]
}
```