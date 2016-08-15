---
title: LeetCode-191. Number of 1 Bits  
date: 2016-08-15 15:36:55  
categories: Algorithm  
tags: LeetCode  
---

## 191. Number of 1 Bits  

Write a function that takes an unsigned integer and returns the number of ’1' bits it has (also known as the [Hamming weight](https://en.wikipedia.org/wiki/Hamming_weight)).

For example, the 32-bit integer ’11' has binary representation `00000000000000000000000000001011` , so the function should return 3.

## Translation

编写一个函数，它接收一个无符号整数并返回它二进制形式中 '1'的个数(也称为[Hamming weight](https://en.wikipedia.org/wiki/Hamming_weight))。

例如，整数 ‘11’ 的32位二进制表示形式为 `00000000000000000000000000001011` ，所以函数应当返回3。

## The idea of solving process

**由于这题暂时不能使用 Swift 来提交代码，所以暂时使用 Java 来编写代码。**  
求一个整数二进制中1的个数，可以考虑将这个整数转换成二进制，再统计1的个数即可。

将整数转换成二进制，只需要将这个数不断的除以2然后取余数即可。题目中明确说明参数是无符号整数，可以换一种思路，考虑位运算。

1. 首先将参数与 1 做 & 运算，可以得到最低位是否是1。
2. 然后将参数做位运算右移1位，重复第1步。这样就可以统计出二进制形式中1的个数了。

无符号右移一位使用运算符 `>>>` ，是以二进制代码进行的。

完整代码如下所示：

## AC Code

```java
public class Solution
{
    // you need to treat n as an unsigned value
    public int hammingWeight(int n)
    {
        int count = 0;
        while(n != 0)
        {
            if((n & 1) == 1)
            {
				count++;
            }
            n >>>= 1;
        }
        return count;
    }
}
```