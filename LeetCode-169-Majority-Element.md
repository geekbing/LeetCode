---
title: LeetCode-169. Majority Element  
date: 2016-08-01 10:46:45  
categories: Algorithm  
tags: LeetCode  
---

### 169. Majority Element  

Given an array of size n, find the majority element. The majority element is the element that appears **more than** `⌊ n/2 ⌋` times.

You may assume that the array is non-empty and the majority element always exist in the array.

### Translation

给定一个大小为 n 的数组，找出主要的元素。主要的元素是出现次数**大于** `⌊ n/2 ⌋` 次的元素（即出现次数超过半数的元素）。

你可以认为数组非空并且数组的主要元素总是存在。

### The idea of solving process

方案一：  
第一想法是遍历数组一边，使用字典来存储数组每个元素出现的次数，然后找出次数大于一半的元素即可。思路非常简单，代码实现起来也非常容易。代码也 AC 了。但是空间复杂度为 `O(n)` 虽然题目并没有限制空间复杂度。总觉得还有更好的解决方案。

方案二：  
查看了讨论区之后，发现了一个非常棒的解决方案。

首先将数组第一个元素当成主要元素，并使用一个变量 `count（初始值为1）` 来记录主要元素次数减去其他元素的次数的结果。

从第二个元素开始遍历数组元素，如果遇到主要元素，则 `count 加1`，否则 `count 减1`。

**若 `count 值为 0`，则说明到目前为止，还没有发现主要元素，主要元素在数组后半段。此时需要将 `count` 重置为1，并且将主要元素设置为下一个元素值。**

下面举例说明，例如对于 `[1, 2, 3, 2, 2]`

初始情况 `count = 1，major = 1`。

扫描到 `2`，由于遇到的不是主要元素，则 `count减1`，此时`count = 0` ，需要重新设置主要元素。`count = 1，major = 2`。

扫描到 `3`，由于遇到的不是主要元素，则 `count减1`，此时`count = 0` ，需要重新设置主要元素。`count
= 1，major = 3`。

扫描到 `2`，由于遇到的不是主要元素，则 `count减1`，此时`count = 0` ，需要重新设置主要元素。`count
= 1，major = 2`。

扫描到 `2`，由于遇到的是主要元素，则 `count加1`，此时`count = 2，major = 2`。

循环结束。

详细代码如下所示：

### AC CODE

方案一完整代码：

```javascript
func majorityElement(nums: [Int]) -> Int
{
    var dict: [Int: Int] = [:]
    
    for num in nums
    {
        if dict[num] != nil
        {
            dict[num]! += 1
        }
        else
        {
            dict[num] = 1
        }
    }
    for key in dict.keys
    {
        if dict[key] >= nums.count / 2 + 1
        {
            return key
        }
    }
    return 0
}
```

方案二完整代码：

```javascript
func majorityElement(nums: [Int]) -> Int
{
    var major = nums[0]
    var count = 1
    for i in 1..<nums.count
    {
        if count == 0
        {
            count = 1
            major = nums[i]
        }
        else if major == nums[i]
        {
            count += 1
        }
        else
        {
            count -= 1
        }
    }
    return major
}
```
