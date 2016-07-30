---
title: LeetCode-231. Power of Two  
date: 2016-07-30 09:03:22  
categories: Algorithm  
tags: LeetCode  
---

### 231. Power of Two  

Given an integer, write a function to determine if it is a power of two.

### 题目翻译

给定一个整数，写一个函数判断给定的整数是不是2的幂次方。

### 解题思路

这题非常简单，不断的循环的做下面两步操作：

1. 将整数余2看结果是否为0，如果不为0则不是2的幂次方，直接返回false；如果是则说明是2的倍数，继续第二步

2. 上如果是2的倍数，直接将整数除以2，减少一半。继续第一步。

循环结束的条件为，看整数是否等于1，因为2的幂次方不断的除以2，最终结果都是1。

代码很容易就写出来了。

### AC Code

```javascript
func isPowerOfTwo(n: Int) -> Bool
{
    if n <= 0
    {
        return false
    }
    
    var num = n
    
    while num != 0
    {
        if num == 1
        {
            return true
        }
        else if num % 2 != 0
        {
            return false
        }
        num /= 2
    }
    return true
}
```
