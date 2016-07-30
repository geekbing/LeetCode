---
title: LeetCode-326. Power of Three  
date: 2016-07-30 09:45:22  
categories: Algorithm  
tags: LeetCode  
---

### 326. Power of Three  

Given an integer, write a function to determine if it is a power of three.

**Follow up:**

Could you do it without using any loop / recursion?

### 题目翻译

给定一个整数，写一个函数判断给定的整数是不是3的幂次方。

**更进一步:**

您能够不使用任何循环来解决这道题目吗？

### 解题思路

之前做过一道[判断是否是2的幂次方的题目](https://leetcode.com/problems/power-of-two/)。大家可以看我的[博客](http://geekbing.com/2016/07/30/LeetCode-231-Power-of-Two/)的解答过程

看到题目第一印象就是使用非常简单的循环来解决。但是题目却说可以不使用任何循环结构来解决这道题目，顿时蒙了。

最后参考了讨论区，看到一个眼前一亮的答案：

**任何一个3的x次方一定能被int型里最大的3的x次方整除**

而int型3的x次方最大的数是1162261467（只考虑32位，范围是-2147483648到2147483647）。

3的18次方是1162261467

3的19次方是3486784401，溢出。

### AC Code

```javascript
func isPowerOfThree(n: Int) -> Bool
{
    return (n > 0) && (1162261467 % n == 0)
}
```
