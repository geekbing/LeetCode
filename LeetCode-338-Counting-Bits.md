---
title: LeetCode-338. Counting Bits  
date: 2016-08-16 14:57:32  
categories: Algorithm  
tags: LeetCode   
---

## 338. Counting Bits  

Given a non negative integer number num. For every numbers i in the range 0 ≤ i ≤ num calculate the number of 1's in their binary representation and return them as an array.

**Example:**  
For `num = 5` you should return `[0,1,1,2,1,2]`.

**Follow up:**

+ It is very easy to come up with a solution with run time O(n ＊ sizeof(integer)). But can you do it in linear time O(n) /possibly in a single pass?
+ Space complexity should be O(n).
+ Can you do it like a boss? Do it without using any builtin function like __builtin_popcount in c++ or in any other language.

**Hint:**

1. You should make use of what you have produced already.
2. Divide the numbers in ranges like [2-3], [4-7], [8-15] and so on. And try to generate new range from previous.
3. Or does the odd/even status of the number help you in calculating the number of 1s?

## Translation

给定一个非负整数 num。对于范围在 0≤ i ≤ num 中的 i 计算 i 的二进制表示形式中 1 的数量，并将它们当作数组返回。
**例如：**给定 `num = 5` 你应当返回 `[0,1,1,2,1,2]`。
**更进一步：**

+ 很容易想出了一个时间复杂度为 O(n ＊ sizeof(integer)) 的算法。但是你能想到线性时间复杂度为O(n)且只遍历一边数组的算法吗？
+ 空间复杂性应该是O(n)。
+ 你能够像大牛一样不使用像c++中的 __builtin_popcount 函数或任何其他语言中的任何内置函数吗？

**提示：**

1. 你应该利用你之前已经生成的结果。
2. 把范围内的数字划分为像[2 － 3]，[4 － 7]，［8 － 15］等等这样的区间。并尝试从之前的区间生成新的区间。
3. 也许整数的奇 / 偶状态能够帮助你计算二进制位中1的数量?

## The idea of solving process

毫无疑问**如果一个非负整数是偶数，则它的二进制形式的最低位为0；否则最低位为1。**  
所以，可以先将这个数字向右移动一位，得到较小的一个数。  
接着可以非常容易的得到递推公式：

```swift
ans[i] = ans[i >> 1] + i % 2
```

完整代码如下所示：

## AC Code

```swift
func countBits(num: Int) -> [Int]
{
    if num == 0
    {
        return [0]
    }
    var ans = Array(count: num + 1, repeatedValue: 0)
    for i in 1...num
    {
        ans[i] = ans[i >> 1] + i % 2
    }
    return ans
}
```