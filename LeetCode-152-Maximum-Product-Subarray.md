---
title: LeetCode-152. Maximum Product Subarray  
date: 2016-08-11 15:39:24  
categories: Algorithm  
tags: LeetCode   
---

## 152. Maximum Product Subarray  

Find the contiguous subarray within an array (containing at least one number) which has the largest product.

For example, given the array `[2, 3, -2, 4]`,  
the contiguous subarray `[2, 3]` has the largest product = `6`.

## Translation

找到一个数组内的最大连续乘积的子数组（包含至少一个数字）。
例如, 给定数组 `[2, 3, -2, 4]`,  连续子数组 `[2、3]` 拥有最大的乘积 `6`。

## The idea of solving process

和之前的一题[53. Maximum Subarray](https://leetcode.com/problems/maximum-subarray/)，思路非常相似。之前的[解题思路博客地址](http://geekbing.com/2016/08/10/LeetCode-53-Maximum-Subarray/)。

使用一个变量 `preMax` 来保存以上一个元素结尾的最大连续子数组的乘积  
使用一个变量 `preMin` 来保存以上一个元素结尾的最小连续子数组的乘积  
使用一个变量 `nowMax` 来保存以当前元素结尾的最大连续子数组的乘积  
使用一个变量 `nowMin` 来保存以当前元素结尾的最小连续子数组的乘积  

则可以得出：

```swift
nowMax = max(preMax * nums[i], preMin * nums[i], nums[i])
nowMin = min(preMax * nums[i], preMin * nums[i], nums[i])
```

清楚递推关系式之后，则很容易求出最大子数组的和。  
完整代码如下所示：

## AC Code

```swift
func maxProduct(nums: [Int]) -> Int
{
    var ans = nums[0]
    var preMax = nums[0]
    var preMin = nums[0]
    var nowMax: Int
    var nowMin: Int
    
    for i in 1..<nums.count
    {
        nowMax = max(preMax * nums[i], preMin * nums[i], nums[i])
        nowMin = min(preMax * nums[i], preMin * nums[i], nums[i])
        if nowMax > ans
        {
            ans = nowMax
        }
        
        preMax = nowMax
        preMin = nowMin
    }
    return ans
}
```