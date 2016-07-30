---
title: LeetCode-263. Ugly Number  
date: 2016-07-30 13:09:22  
categories: Algorithm  
tags: LeetCode  
---

### 263. Ugly Number

Write a program to check whether a given number is an ugly number.

Ugly numbers are positive numbers whose prime factors only include `2, 3, 5`. For example, `6, 8` are ugly while 14 is not ugly since it includes another prime factor `7`.

Note that `1` is typically treated as an ugly number.

### 题目翻译

写一个程序来判断给定的一个数字是不是丑数。

丑数是那些质因数只包含`2、3、5`的正整数。例如，`6，8`是丑数而14不是丑数，因为它的质因数包括`7`。

### 解题思路

一个正整数如果它的质因数只包含`2、3、5`的话，那么用它不断的去除以`2、3、5`的话，最终结果会是1，如果最终结果不是1，则不是丑数。

主要运算过程如下：

1. 如果这个数能够整除2，则让这个数除以2；
2. 如果这个数能够整除3，则让这个数除以3；
3. 如果这个数能够整除5，则让这个数除以5；
4. 否则，判断结果是不是1，是的话则是丑数；否则，这个数不是丑数。

思路清楚之后，代码就不难写了。

### AC Code

```javascript
func isUgly(num: Int) -> Bool
{
    if num <= 0
    {
        return false
    }
    
    var n = num

    while n != 1
    {
        if n % 2 == 0
        {
            n = n / 2
        }
        else if n % 3 == 0
        {
            n = n / 3
        }
        else if n % 5 == 0
        {
            n = n / 5
        }
        else
        {
            return false
        }
    }
    return true
}
```
