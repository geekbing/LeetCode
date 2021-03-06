---
title: LeetCode-371. Sum of Two Integers  
date: 2016-08-03 08:56:26  
categories: Algorithm  
tags: LeetCode  
---

## 371. Sum of Two Integers

Calculate the sum of two integers a and b, but you are not allowed to use the operator + and -.

**Example:**  
Given a = 1 and b = 2, return 3.

## Translation

计算两个整数 a 和 b 的和，但是你不允许使用运算符 + 和 －。

**例如**  
给定 a = 1 ，b = 2, 返回 3。

## The idea of solving process

首先分析十进制 `5 + 17 = 22` 的加法过程。实际上可以分解成为以下三步：  
  
1. 第一步只做每一位相加但不计进位，此时相加的结果是12（个位数5和7相加不要进位是2，十位数0和1相加结果是1）
2. 第二步做进位，5 + 7中有进位，进位的值是10
3. 第三步把前面两个结果加起来，12 + 10 的结果是 22，刚好 5 + 17 = 22
  
对数字做运算，除了四则运算之外，也就只剩下位运算了。位运算是针对二进制的，我们也就以二进制再来分析一下前面的三步走策略对二进制是不是也管用。5的二进制是 `101`，17的二进制 `10001`。还是试着把计算分成三步：

1. 第一步只做每一位相加但不计进位，得到的结果是10100（最后一位两个数都是1，相加的结果是二进制的10。这一步不计进位，因此结果仍然是0）
2. 第二步记下进位。在这个例子中只在最后一位相加时产生一个进位，结果是二进制的10
3. 第三步把前两步的结果相加，得到的结果是10110，正好是22。

由此可见三步走的策略对二进制也是管用的。接下来我们试着把二进制上的加法用位运算来替代。

1. 第一步只做每一位相加但不计进位。0加0与 1加1的结果都0，0加1与1加0的结果都是1。我们可以注意到，这和异或的结果是一样的。对异或而言，0和0、1和1异或的结果是0，而0和1、1和0的异或结果是1。
2. 接着考虑第二步进位，对0加0、0加1、1加0而言，都不会产生进位，只有1加1时，会向前产生一个进位。此时我们可以想象成是两个数先做位与运算，然后再向左移动一位。只有两个数都是1的时候，位与得到的结果是1，其余都是0。
3. 第三步把前两个步骤的结果相加。如果我们定义一个函数，第三步就相当于输入前两步骤的结果来递归调用自己。

完整代码如下所示：

## AC Code

```javascript
func getSum(a: Int, _ b: Int) -> Int
{
    if b == 0
    {
        return a
    }
    let sumWithNoCarry = a ^ b
    let carry = (a & b) << 1
    
    return getSum(sumWithNoCarry, carry)
}
```