---
title: LeetCode-27. Remove Element  
date: 2016-08-06 12:35:18  
categories: Algorithm  
tags: LeetCode  
---

## 27. Remove Element  

Given an array and a value, remove all instances of that value in place and return the new length.

Do not allocate extra space for another array, you must do this in place with constant memory.

The order of elements can be changed. It doesn't matter what you leave beyond the new length.

**Example:**  
Given input array nums = `[3,2,2,3]`, val = `3`

Your function should return length = 2, with the first two elements of nums being 2.

**Hint:**

1. Try two pointers.
2. Did you use the property of "the order of elements can be changed"?
3. What happens when the elements to remove are rare?

## Translation

给定一个数组和一个值，删除所有这个值的元素并返回新的长度。  
不要为另一个数组分配额外的空间，你必须使用常量的内存空间。  
元素的顺序可以改变。数组新的长度以外的元素是什么没关系。  
**例如：**  
给定数组 nums = `[3,2,2,3]`, val = `3`  
你的函数应当返回长度 length = 2, 并且数组 nums 的前两个元素应当是2 。  
**提示：**  
1. 尝试使用2个指针。  
2. 你使用了"元素的顺序可以改变这个属性吗" ?  
3. 当需要删除的元素很少时会发生什么呢？

## The idea of solving process

Swift 自带删除 index 位置的函数 `removeAtIndex` 。  
思路很简单，从头到尾遍历数组。  
如果当前元素的值为 `val` ，则删除当前元素。  
否则，继续循环判断下一个元素。

## AC Code

```swift
func removeElement(inout nums: [Int], _ val: Int) -> Int
{
    var i = 0
    while i < nums.count
    {
        if nums[i] == val
        {
            nums.removeAtIndex(i)
        }
        else
        {
            i += 1
        }
    }
    return nums.count
}
```