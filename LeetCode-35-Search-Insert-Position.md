---
title: LeetCode-35. Search Insert Position  
date: 2016-08-10 14:34:57  
categories: Algorithm  
tags: LeetCode   
---

## 35. Search Insert Position  

Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

You may assume no duplicates in the array.

Here are few examples.  
`[1,3,5,6]`, 5 → 2  
`[1,3,5,6]`, 2 → 1  
`[1,3,5,6]`, 7 → 4  
`[1,3,5,6]`, 0 → 0  

## Translation

给定一个排好序的数组和一个目标值，如果在数组中找到了目标值则返回它的索引；如果没有，返回目标值将会插入位置的索引。  
你可以认为数组中没有重复的元素。  
下面是一些例子.  
`[1,3,5,6]`, 5 → 2  
`[1,3,5,6]`, 2 → 1  
`[1,3,5,6]`, 7 → 4  
`[1,3,5,6]`, 0 → 0  

## The idea of solving process

典型的二分查找算法。二分查找算法是在有序数组中用到的较为频繁的一种算法，在未接触二分查找算法时，最通用的一种做法是，对数组进行遍历，跟每个元素进行比较，其时间为O(n)。但二分查找算法则更优，可在最坏的情况下用 `O(log n)` 完成搜索任务。譬如数组 `{1，2，3，4，5，6，7，8，9}`，查找元素6，用二分查找的算法执行的话，其顺序为：
    
1. 第一步查找中间元素，即5，由于 `5 < 6` ，则6必然在5之后的数组元素中，那么就在{6，7，8，9}中查找，
2. 寻找 `{6, 7, 8, 9}` 的中位数，为7，7 > 6，则6应该在7左边的数组元素中，那么只剩下6，即找到了。

**二分查找算法就是不断将数组进行对半分割，每次拿中间元素和 target 进行比较。**

详细的代码如下所示：

## AC Code

```swift
func searchInsert(nums: [Int], _ target: Int) -> Int
{
    var low = 0
    var high = nums.count - 1
    if target <= nums[0]
    {
        return 0
    }
    if target > nums[high]
    {
        return high + 1
    }
    while low <= high
    {
        let middle  = (high - low) / 2 + low    // 直接使用(high + low) / 2 可能导致溢出
        if nums[middle] > target                // 在左半边
        {
            high = middle - 1
        }
        else if nums[middle] == target          // 直接找到了
        {
            return middle
        }
        else                                    // 在右半边
        {
            low = middle + 1
        }
    }
    return low
}
```