---
title: LeetCode-88. Merge Sorted Array
date: 2016-08-17 19:06:37
categories: Algorithm  
tags: LeetCode   
---

## 88. Merge Sorted Array

Given two sorted integer arrays *nums1* and *nums2*, merge nums2 into *nums1* as one sorted array.

**Note:**  
You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2. The number of elements initialized in nums1 and nums2 are m and n respectively.

## Translation

给定两个排好顺序的整数数组 *nums1* 和 *nums2*，将 *nums2* 合并到 *nums1* 中，并使得 *nums1* 成为一个有序数组。  
**注意：**    
你可以认为 nums1 有足够的空间(大于或等于m + n)来存储 nums2 中的元素。数组 nums1 和 nums2 初始化的元素数量分别 m 和 n。

## The idea of solving process

既然 nums1 和 nums2 都是有序的，为了将 nums2 存放进 nums1 中，我们**可以考虑从两个数组的结尾开始进行排序**。与之前做过的两个数组的排序差不多。

从结尾开始，即 `var last = m + n - 1`。然后分别比较大小，依次向前填充数组即可。需要注意的是：数组 nums1 和 nums1 可能遍历结束的情况，需要特别处理。

完整代码如下所示：

## AC Code

```swift
func merge(inout nums1: [Int], _ m: Int, _ nums2: [Int], _ n: Int)
{
    var last = m + n - 1
    var index1 = m - 1
    var index2 = n - 1
    while last >= 0
    {
        if index1 < 0
        {
            nums1[last] = nums2[index2]
            index2 -= 1
            last -= 1
            continue
        }
        if index2 < 0
        {
            nums1[last] = nums1[index1]
            index1 -= 1
            last -= 1
            continue
        }
        if nums1[index1] > nums2[index2]
        {
            nums1[last] = nums1[index1]
            index1 -= 1
        }
        else
        {
            nums1[last] = nums2[index2]
            index2 -= 1
        }
        last -= 1
    }
}
```