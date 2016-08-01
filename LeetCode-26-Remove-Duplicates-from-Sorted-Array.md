---
title: LeetCode-26. Remove Duplicates from Sorted Array  
date: 2016-08-01 17:26:58  
categories: Algorithm  
tags: LeetCode  
---

### 26. Remove Duplicates from Sorted Array  

Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.

Do not allocate extra space for another array, you must do this in place with constant memory.

For example,  
Given input array nums = `[1,1,2]`,

Your function should return length = `2`, with the first two elements of nums being `1` and `2` respectively. It doesn't matter what you leave beyond the new length.

### Translation

给定一个排好顺序的数组，删除重复的元素，这样每个元素只出现一次，并返回新数组的长度。

不要为另一个数组分配额外的空间，你必须使用常量的内存空间。

例如：给定输入数组 nums = `[1,1,2]`, 你的函数应该返回长度 `2` , 并且 `nums` 的前两个元素分别是`1`和 `2`。新数组 `2` 以后的元素是什么无关紧要。

### The idea of solving process

**由于给定的数组是排好顺序的，所以遍历数组的时候，只需要判断当前元素是否跟前一个元素相等。**  
**如果相等，则需要从数组中将当前元素删除；**  
**若不相等，则继续下一个循环，判断下一个元素。**

思路很简单，代码也很简单。详细代码如下所示：

### AC Code

```javascript
func removeDuplicates(inout nums: [Int]) -> Int
{
    if nums.count < 2
    {
        return nums.count
    }
    
    var index = 1
    
    while index < nums.count
    {
        if nums[index] == nums[index - 1]
        {
            nums.removeAtIndex(index)
        }
        else
        {
            index += 1
        }
    }
    return nums.count
}
```