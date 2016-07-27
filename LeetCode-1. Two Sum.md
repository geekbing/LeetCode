---
title: LeetCode-1. Two Sum  
date: 2016-07-27 13:07:58  
categories: Algorithm  
tags: LeetCode  
---

从今天开始，开启LeetCode刷题模式。每天至少解决一道题目,按照题目序号做下去，如果遇到实在是太难的题目，暂且跳过。

### 1. Two Sum

Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution.

### Example:

```
Given nums = [2, 7, 11, 15], target = 9,
			
Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
```

### 题目翻译

给定一个整数的数组，要求返回两个整数的下标（这两个整数相加得到一个给定的目标值）。

你可以假设对于每一组输入有且仅有一个特定的解决方案。

### 解题思路

遍历数组元素，对于每一个当前的整数，继续从这个整数之后开始循环数组元素（即二重循环），看当前元素是否和之后的数组元素相加与给定的值相等。如果相等，则这两个整数就是要找的整数，将它们的下标组合成数组返回即可。

### AC Code

```javascript
class Solution 
{
    func twoSum(nums: [Int], _ target: Int) -> [Int] 
    {	
    	// 遍历数组元素
        for i in 0..<nums.count 
        {
            for j in (i+1)..<nums.count 
            {
                if nums[i] + nums[j] == target 
                {
                    return [i, j]
                }
            }
        }
        
        return [0, 0]
    }
}
```


