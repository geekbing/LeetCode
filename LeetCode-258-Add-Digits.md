---
title: LeetCode-258. Add Digits
date: 2016-07-29 16:39:41
categories: Algorithm  
tags: LeetCode  
---

### LeetCode-258. Add Digits

Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.

For example:

Given num = 38, the process is like: 3 + 8 = 11, 1 + 1 = 2. Since 2 has only one digit, return it.

Follow up:
Could you do it without any loop/recursion in O(1) runtime?

Hint:

A naive implementation of the above process is trivial. Could you come up with other methods?

What are all the possible results?

How do they occur, periodically or randomly?

You may find this [Wikipedia](https://en.wikipedia.org/wiki/Digital_root) article useful.

### 题目翻译

给你一个非负整数num，重复的增加num的所有数字，直到结果只有一个数字为止。

例如：

给定num = 38, 计算过程是这样的: 3 + 8 = 11, 1 + 1 = 2。因为2只有1个数字，所以返回它。

更进一步：

你能想到不用任何循环并且时间复杂度是O(1)的方法吗？

**提示:**

简单实现上述过程是微不足道的，你能想出其他的方法吗?

所有可能的结果是什么?

他们如何出现的，定期或随机的?

你可能会发现[维基百科](https://en.wikipedia.org/wiki/Digital_root)的这篇文章很有用。

### 解题思路

使用循环的话很简单就可以算出来结果。但是题目提示可以不用循环并且时间复杂度可以是O(1)，那么只可能是数学方法了。最后给的维基百科链接地址点进去，原来是求解一个整数的数根(Digital root)。

并且给出了求解公式，整数n的数根用`dr(n)`表示：

![image](http://diary123.oss-cn-shanghai.aliyuncs.com/Digital_root1.png)

![image](http://diary123.oss-cn-shanghai.aliyuncs.com/Digital_root2.png)


下面我们先来证明下面一个结论：**一个数余9等于这个数的数根余9。**

拿数字123456举例：

12345 ＝ 1 ＊ 10000 ＋ 2 ＊ 1000 ＋ 3 ＊ 100 ＋ 4 ＊ 10 ＋ 5

12345 ＝ 1 ＊ （9999 ＋ 1） ＋ 2 ＊ （999 ＋ 1） ＋ 3 ＊ （99 ＋ 1） ＋ 4 ＊ （9 ＋ 1） ＋ 5

12345 ＝ (1 ＊ 9999 ＋ 2 ＊ 999 ＋ 3 ＊ 99 ＋ 4 ＊ 9) ＋ （1 ＋ 2 ＋3 ＋ 4 ＋ 5）

12345 ％ 9 ＝ （1 ＋ 2 ＋ 3 ＋ 4 ＋ 5）％ 9

12345 ％ 9 ＝ （1 ＋ 2 ＋ 3 ＋ 4 ＋ 5）％ 9 ＝ 15 ％ 9 ＝ （1 ＋ 5）％ 9 ＝ 6 ％ 9

故一个数余9等于这个数的数根余9。 即可以得到公式：

```
n % 9 = dr(n) % 9
```

又由于数根的范围为0－9，故可以进一步得到下面的结论：

```
当n = 0, dr(n) = 0
当n > 0 且 n % 9 = 0 时, dr(n) = 9
当n > 0 且 n % 9 != 0 时，dr(n) = n % 9
```

所以写程序就非常容易了。

### AC Code  

```javascript
func addDigits(num: Int) -> Int
{
    if num == 0
    {
        return 0
    }
    else if num % 9 == 0
    {
        return 9
    }
    else
    {
        return num % 9
    }
}
```