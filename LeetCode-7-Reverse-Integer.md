---
title: LeetCode-7. Reverse Integer  
date: 2016-07-28 13:33:38  
categories: Algorithm  
tags: LeetCode  
---

### 7. Reverse Integer

Reverse digits of an integer.

Example1: x = 123, return 321
Example2: x = -123, return -321

Have you thought about this?
Here are some good questions to ask before coding. Bonus points for you if you have already thought through this!

If the integer's last digit is 0, what should the output be? ie, cases such as 10, 100.

Did you notice that the reversed integer might overflow? Assume the input is a 32-bit integer, then the reverse of 1000000003 overflows. How should you handle such cases?

For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.

### 题目翻译

反转整数的数字。

例1: x = 123, 返回 321

例2: x = -123, 返回 -321

在写代码之前，你考虑过下面的这些问题吗？

假如数字的最后一位是0，应该输出什么呢？例如10，100。  

你注意到反转整数可能会导致溢出吗？假设输入是32位的整数（范围是-2147483648到2147483647），反转整数1000000003得到的结果3000000001会导致溢出。你应该如何处理这种情况呢？

对于上面的情况，当反转整数发生溢出的时候，你的函数应该返回0。

### 解题思路

反转正整数难度不大，我们很快就会有思路。

先拿一个简单的例子分析一下，例如反转123，计算过程为

（（3 ＊ 10 ＋ 2）＊10 ＋ 1） ＝ 321

即计算过程为不断的乘10再加上剩余的数字余10得到的数字。

其实上面的这种思路对于负数来说，其实同样适用。例如反转－123的计算过程如下：

（－3 ＊ 10 ＋（－2）） ＊ 10 ＋ （－1） ＝ －321  

基于上面的分析，我们很快可以写出对应的程序：

```javascript
func reverse(x: Int) -> Int
{
    var num = x
    var ans = 0
    while num != 0
    {
        let tail = num % 10
        let newResult = ans * 10 + tail
        ans = newResult
      	
        num = num / 10
    }
    return ans
}
```

不要忘记了题目中提到的整数溢出的问题，其实有一个很巧妙的方式来实现。

下面是代码中得到newResult的计算方式：
```
let newResult = ans * 10 + tail
```

为了不发生溢出，我们可以对临界条件进行判断，发生溢出的情况如下

如果 ans > 214748364

如果 ans == 214748364 并且 tail > 7

如果 ans < －214748364

如果 asn == －214748364 并且 tail < -8

由此可以得到判断是否溢出的条件

```
if (ans > 214748364) || (ans == 214748364 && tail > 7) || (ans < -214748364) || (ans == -214748364 && tail < -8)
{
	return 0
}
```
将判断溢出的条件加上就可以得到正确的结果。

### AC Code  

```javascript
func reverse(x: Int) -> Int
{
    var num = x
    var ans = 0
    while num != 0
    {
        let tail = num % 10
        let newResult = ans * 10 + tail
        if (ans > 214748364) || (ans == 214748364 && tail > 7) || (ans < -214748364) || (ans == -214748364 && tail < -8)
        {
            return 0
        }
        ans = newResult
        num = num / 10
    }
    return ans
}
```