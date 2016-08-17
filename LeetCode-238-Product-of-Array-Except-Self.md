---
title: LeetCode-238. Product of Array Except Self  
date: 2016-08-17 12:46:03  
categories: Algorithm  
tags: LeetCode  
---

## 238. Product of Array Except Self

Given an array of n integers where n > 1, `nums`, return an array `output` such that `output[i]` is equal to the product of all the elements of `nums` except `nums[i]`.

Solve it **without division** and in O(n).

For example, given `[1,2,3,4]`, return `[24,12,8,6]`.

**Follow up:**  
Could you solve it with constant space complexity? (Note: The output array **does not** count as extra space for the purpose of space complexity analysis.)

## Translation

给定 n 个整数的数组 nums，并且 n > 1，返回一个数组 output，数组 output 中的第 i 个元素 output[i] 等于数组 nums 中除了它自己外的所有元素的乘积。  
**不使用除法**来解决这题，并且时间复杂度为O(n)。  
例如，对于给定的数组 `[1,2,3,4]`, 返回 `[24,12,8,6]`。
**更进一步：**  
你能使用常量的空间复杂性来解决这道题目吗？（注意：为了分析空间复杂度，输出数组**不算作额外空间**）

## The idea of solving process

在讨论区中看到一个非常棒的解答。下面来描述一下主要思路：**对于每个数，将这个数所有左边的数相乘，同时将这个数所有右边的数相乘，最后把左右结果相乘即可。**
举例说明：对于数组 `[2,3,4,5]`，先从左到右做乘法。这样每个数对应的值就是这个数在数组左边的所有数的乘积。

```
2		3		4		5
1		1x2		1x2x3		1x2x3x4
```

接着先从右到左做乘法。这样每个数对应的值就是这个数在数组左右两边的所有数的乘积了。

```
2			3			4			5
1			1x2			1x2x3			1x2x3x4
1x3x4x5		1x2x4x5		1x2x3x5		1x2x3x4
```

完整代码如下所示：

## AC Code

```swift
func productExceptSelf(nums: [Int]) -> [Int]
{
    var ans = [1]
    
    for i in 1..<nums.count
    {
        ans.append(ans[i - 1] * nums[i - 1])
    }
    
    var right = 1
    var i = nums.count - 1
    while i >= 0
    {
        ans[i] *= right
        right *= nums[i]
        i -= 1
    }
    return ans
}
```