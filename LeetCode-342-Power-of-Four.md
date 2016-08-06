---
title: LeetCode-342. Power of Four  
date: 2016-08-06 11:10:29  
categories: Algorithm  
tags: LeetCode  
---

## 342. Power of Four

Given an integer (signed 32 bits), write a function to check whether it is a power of 4.

**Example:**  
Given num = 16, return true. Given num = 5, return false.

**Follow up:** Could you solve it without loops/recursion?

## Translation

给定一个带符号的32位的整数，编写一个函数来判断它是不是4的幂。  
**例如：**给定 num = 16, 返回 true. 给定 num = 5, 返回 false.  
**更进一步：** 你能够不用循环和递归来解决这题吗？

## The idea of solving process

解决这题使用循环或者递归非常容易，不停的除以4，看最终结果是否为1。难点在于后面的附加条件：不能用循环和递归。

1. 首先一个数小于或等于0，则肯定不是。
2. 一个数 num，如果是 2 的 N 次方，那么有：`num & (num - 1) = 0`
3. 一个数 num 如果是 4 的 N 次方必然也是 2 的 N 次方。所以可以先判断 num 是否是 2 的 N 次方。
4. 发现只要是4的次方数，减1之后可以被3整除

完整代码如下所示：

## AC Code

```swift
func isPowerOfFour(num: Int) -> Bool
{
    if num <= 0
    {
        return false
    }
    if num & (num - 1) != 0
    {
        return false
    }
    if (num - 1) % 3 == 0
    {
        return true
    }
    return false
}
```