---
title: LeetCode-357. Count Numbers with Unique Digits  
date: 2016-08-17 14:11:21  
categories: Algorithm  
tags: LeetCode  
---

## 357. Count Numbers with Unique Digits  

Given a **non-negative integer** n, count all numbers with unique digits, x, where 0 ≤ x < 10<sup>n</sup>.

**Example:**  
Given n = 2, return 91. (The answer should be the total numbers in the range of 0 ≤ x < 100, excluding `[11,22,33,44,55,66,77,88,99]`)

**Hint:**

1. A direct way is to use the backtracking approach.
2. Backtracking should contains three states which are (the current number, number of steps to get that number and a bitmask which represent which number is marked as visited so far in the current number). Start with state (0,0,0) and count all valid number till we reach number of steps equals to 10<sup>n</sup>.
3. This problem can also be solved using a dynamic programming approach and some knowledge of combinatorics.
4. Let f(k) = count of numbers with unique digits with length equals k.
5. f(1) = 10, ..., f(k) = 9 * 9 * 8 * ... (9 - k + 2) [The first factor is 9 because a number cannot start with 0].

## Translation

给定一个非负整数 n，计算在范围 0≤ x < 10<sup>n</sup> 内包含不同数字的整数的个数。  
**例如：**给定 n = 2, 返回 91。 (答案应当是在范围 0 ≤ x < 100中除了 `[11,22,33,44,55,66,77,88,99]` 的所有整数)  
**提示：**

1. 一个直接的方法就是实用回溯法。
2. 回溯法应当包含3个状态， (3个状态分别为当前的数字, 得到当前整数的步数和一个代表到目前为止在当前整数中哪个数字被标记为已经访问的位掩码). 从状态 (0,0,0)开始计算所有有效的数字直到步数等于10<sup>n</sup>。
3. 这个问题也可以使用动态规划的方法和一些组合数学的知识来解决。
4. 用f(k)表示长度为 k 的整数中包含不同数字的整数的个数。  
5. f(1) = 10, ..., f(k) = 9 * 9 * 8 * ... (9 - k + 2) [最开始的系数是9，因为数字不能从0开始］。

## The idea of solving process

在大学组合数字的课上遇到过类似的题目。以n = 3时，［0，1000）举例：

1. 当数字为1位数时，从[0-9]中任选一位即可，共`10`种
2. 当数字为2位数时，第一位先从［1-9］中任意选择一个数字，第二位从剩下的9个数字中任选一个，故 `9 X 9 = 81种`
2. 当数字为3位数时，第一位先从［1-9］中任意选择一个数字，第二位从剩下的9个数字中任选一个，第三位从剩下的8个数字中任选一个，故 `9 X 9 X 8 = 648种`

故一共 10 ＋ 81 ＋ 648 ＝ 739种。题目中的提示也给出了长度为 k 的整数的不同数量的关系式：

```
f(k) = 9 * 9 * 8 * ... (9 - k + 2) 
```

清楚思路之后，写代码就不难了。完整代码如下所示：

## AC Code

```swift
func countNumbersWithUniqueDigits(n: Int) -> Int
{
    if n == 0
    {
        return 1
    }
    if n == 1
    {
        return 10
    }
    var temp = 9
    var ans = 10
    for i in 2...n
    {
        temp *= (9 - i + 2)
        ans += temp
    }
    return ans
}
```
