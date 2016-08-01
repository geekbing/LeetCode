---
title: LeetCode-349. Intersection of Two Arrays  
date: 2016-08-01 08:53:56  
categories: Algorithm  
tags: LeetCode  
---

### 349. Intersection of Two Arrays  

Given two arrays, write a function to compute their intersection.

**Example:**  
Given nums1 = `[1, 2, 2, 1]`, nums2 = `[2, 2]`, return `[2]`.

**Note:**  
+ Each element in the result must be unique.
+ The result can be in any order.

### Translation

给定两个数组，写一个函数来计算他们的交集。

**例如：**  
给定 nums1 = `[1, 2, 2, 1]`, nums2 = `[2, 2]`, 返回 `[2]`.

**Note:**  
+ 返回的结果数组中的元素必须唯一。
+ 返回的结果中的元素可以是任意的顺序。

### The idea of solving process

第一想法就是使用一个空的数组 `ans` 存储数组 `nums1` 和 `nums2` 的交集。
**循环第一个数组 `nums1` 中的所有元素，对于每一个元素 `num`，查看第二个数组 `nums2` 是否包含了当前元素  `num`，同时需要满足结果数组 `ans` 不包含 `num`。**

理解思路之后，代码就非常容易写出来了。详细代码如下所示：

### AC Code

```javascript
func intersection(nums1: [Int], _ nums2: [Int]) -> [Int]
{
    if nums1.count == 0 || nums2.count == 0
    {
        return []
    }
    var ans = [Int]()
    for num in nums1
    {
        if nums2.contains(num) && !ans.contains(num)
        {
            ans.append(num)
        }
    }
    return ans
}
```