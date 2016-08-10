---
title: LeetCode-53. Maximum Subarray  
date: 2016-08-10 21:10:49  
categories: Algorithm  
tags: LeetCode   
---

## 53. Maximum Subarray  

Find the contiguous subarray within an array (containing at least one number) which has the largest sum.

For example, given the array `[−2, 1, −3, 4, −1, 2, 1, −5, 4]`,  
the contiguous subarray `[4, −1, 2, 1]` has the largest sum = `6`.

**More practice:**  
If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.

## Translation

找到一个数组的最大连续的子数组(至少包含一个数字)。  
例如，给定数组 `[−2, 1, −3, 4, −1, 2, 1, −5, 4]`，  最大连续子数组为 `[4, −1, 2, 1]` ，和为 `6`。  
**更多练习：**  
如果你写出了O(n)的算法，尝试使用分而治之来解决这题，算法会更加的精妙。

## The idea of solving process

使用一个变量 `nowMax` 来保存**以当前元素结尾的最大连续子数组的和**  
使用一个变量 `preMax` 来保存**以上一个元素结尾的最大连续子数组的和**  
则可以得出：

```swift
nowMax = max(nums[i], preMax + nums[i])
```
清楚递推关系式之后，则很容易求出最大子数组的和。  
完整代码如下所示：

## AC Code

```swift
func maxSubArray(nums: [Int]) -> Int
{
    var ans = nums[0]
    var preMax = nums[0]
    var nowMax: Int
    
    for i in 1..<nums.count
    {
        nowMax = max(nums[i], preMax + nums[i])
        print(nowMax)
        if nowMax > ans
        {
            ans = nowMax
        }
        preMax = nowMax
    }
    return ans
}
```