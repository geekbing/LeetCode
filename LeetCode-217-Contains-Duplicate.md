---
title: LeetCode-217. Contains Duplicate  
date: 2016-08-01 14:21:07  
categories: Algorithm  
tags: LeetCode  
---

### 217. Contains Duplicate  

Given an array of integers, find if the array contains any duplicates. Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.

### Translation

给定一个整数数组，判断数组是否包含任何相同的元素。如果数组中任何元素值出现至少两次，你的函数应该返回true；否则，如果每个元素都是截然不同的，你的函数应该返回false。

### The idea of solving process

非常简单的一道题目。使用字典存储数组中元素的种类和对应出现的次数，如果发现次数大于1，则返回true。

详细代码如下所示：

### AC Code

```javascript
func containsDuplicate(nums: [Int]) -> Bool
{
    var dict: [Int: Int] = [:]
    
    for num in nums
    {
        if dict[num] != nil
        {
            return true
        }
        else
        {
            dict[num] = 1
        }
    }
    return false
}
```