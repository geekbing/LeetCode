---
title: LeetCode-119. Pascal's Triangle II  
date: 2016-08-01 16:47:38  
categories: Algorithm  
tags: LeetCode  
---

### 119. Pascal's Triangle II  

Given an index k, return the k'th row of the Pascal's triangle.

For example, given k = 3,  
Return [1,3,3,1].

**Note:**  
Could you optimize your algorithm to use only O(k) extra space?

### Translation

给定索引 k，返回帕斯卡三角形的第 k 行。

例如：给定 k = 3， 返回 [1，3，3，1]。

**注意：**

你能优化你的算法，只使用O(k)的额外空间吗？

### The idea of solving process

做过上一题 [118. Pascal's Triangle](https://leetcode.com/problems/pascals-triangle/)（ [解题过程](http://geekbing.com/2016/08/01/LeetCode-118-Pascal-s-Triangle/)）之后。这一题就不算难题了。

注意题目提示可以优化算法只使用O(k)的额外空间。

所以，只使用一个数组存储每一行的数据。第 `n` 行的结果数组在第 `n － 1`行的数组基础之上生成。

需要注意的是：**需要将每一个位置的元素值先保存起来，供生成后一个位置的时候使用。**

完整代码如下所示：

### AC Code

```javascript
func getRow(rowIndex: Int) -> [Int]
{
    if rowIndex == 0
    {
        return [1]
    }
    if rowIndex == 1
    {
        return [1, 1]
    }

    var ans = [1, 1]
    for i in 2...rowIndex
    {
        var temp = 1
        
        // 生成第 i 行的数组
        for j in 1..<i
        {
        	// 第 j 个元素等于当前值加上上一个位置 j － 1 的值
            ans[j] += temp
            // 保存第 j 个元素没有做加法之前的初始值
            temp = ans[j] - temp
        }
        ans.append(1)
    }
    return ans
}
```