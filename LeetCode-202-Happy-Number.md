---
title: LeetCode-202. Happy Number  
date: 2016-07-30 10:41:00  
categories: Algorithm  
tags: LeetCode  
---

### 202. Happy Number  

Write an algorithm to determine if a number is "happy".

A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.

**Example:** 19 is a happy number

![image](http://diary123.oss-cn-shanghai.aliyuncs.com/happy-number.png)

### 题目翻译

写一个算法来判断一个数字是否是"happy"数。

一个"happy"数由下面的过程来定义：从任何正整数开始，用这个正整数的每个位上的数字的平方和取代这个正整数，并重复这个过程直到这个数等于1（它将保持1）；或者它将永远的循环下去，其中这个数不包括1。那些以1结尾的数是"happy"数字。

**例如:** 19是一个"happy"数

![image](http://diary123.oss-cn-shanghai.aliyuncs.com/happy-number.png)

### 解题思路

我们一步步分解题目：

首先，求一个正整数的每个位上数字的平方和很简单，不断的将这个数余10得到最后一位。然后将这个数除以10，去处最后一位数。代码如下：

```javascript
func sumOfHappyNumber(n: Int) -> Int
{
    var num = n
    
    var sum = 0
    while num != 0
    {
        sum += (num % 10) * (num % 10)
        num /= 10
    }
    return sum
}
```

根据题目的定义，小于等于0的正整数不是"happy"数。

题目中又说过，循环计算过程中，可能会产生死循环，举例说明2不是"happy"数，计算过程如下：

2 ＊ 2 ＝ 4  
4 ＊ 4 ＝ 16  
1 ＊ 1 ＋ 6 ＊ 6 ＝ 37  
3 ＊ 3 ＋ 7 ＊ 7 ＝ 58  
5 ＊ 5 ＋ 8 ＊ 8 ＝ 89  
8 ＊ 8 ＋ 9 ＊ 9 ＝ 145  
1 ＊ 1 ＋ 4 ＊ 4 ＋ 5 ＊ 5 ＝ 42  
4 ＊ 4 ＋ 2 ＊ 2 ＝ 20  
2 ＊ 2 ＋ 0 ＊ 0 ＝ 4  
。。。

产生循环了。所以2不是"happy"数。  

那如何来判断是否产生死循环了呢？其实也不难。

我们可以使用一个数组来记录每次计算的结果［4，16，37，58，89，145，42，20，4］。

1. 如果新计算出的结果等于1，说明这个数是"happy"数。

2. 否则，判断新计算的结果是否在数组中。如果在的话，说明会参数死循环，否则将这个数字加入数组中，继续循环。

完整代码如下所示：

### AC Code

```javascript
func sumOfHappyNumber(n: Int) -> Int
{
    var num = n
    var sum = 0
    while num != 0
    {
        sum += (num % 10) * (num % 10)
        num /= 10
    }
    return sum
}

func isHappy(n: Int) -> Bool
{
    if n <= 0
    {
        return true
    }
    
    var num = n
    var sumArr = [Int]()
    var sum = 0
    
    while sum != 1
    {
        sum = sumOfHappyNumber(num)
        if sum == 1
        {
            return true
        }
        else if sumArr.contains(sum)
        {
            return false
        }
        else
        {
            sumArr.append(sum)
            num = sum
        }
    }
    return false
}
```