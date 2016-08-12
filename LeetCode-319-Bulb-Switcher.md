---
title: LeetCode-319. Bulb Switcher  
date: 2016-08-12 09:14:00  
categories: Algorithm  
tags: LeetCode   
---

## 319. Bulb Switcher  

There are n bulbs that are initially off. You first turn on all the bulbs. Then, you turn off every second bulb. On the third round, you toggle every third bulb (turning on if it's off or turning off if it's on). For the ith round, you toggle every i bulb. For the nth round, you only toggle the last bulb. Find how many bulbs are on after n rounds.

**Example:**

Given n = 3. 

```
At first, the three bulbs are [off, off, off].
After first round, the three bulbs are [on, on, on].
After second round, the three bulbs are [on, off, on].
After third round, the three bulbs are [on, off, off]. 
```

So you should return 1, because there is only one bulb is on.

## Translation

有n个灯泡最初是关闭的。第一轮你打开所有的灯泡。第二轮，你关闭所有次序是2倍数的灯泡。在第三轮,你切换次序是3倍数的灯泡（如果它是开着的，则关闭它；否则打开它)。第i轮，你切换所有次序是 i 倍数的灯泡。对于第 n 回合，你只有切换最后一个灯泡。在经过 n 轮之后还有多少灯泡是亮着的。

## The idea of solving process

第一次采用双重循环来模拟开关过程，结果毫无疑问的超时了。看了别人的解答过程之后，恍然大悟。

下面我来解释一下。先复习一个初中的知识：**对于每个数字来说，除了平方数，都有偶数个因数。**  
如6有4个因数：1 × 6 = 6，2 × 3 = 6  
12有6个因数：1 × 12 = 12，2 × 6 = 12，3 × 4 = 12  
但是完全平方数如9只有3个因数：1 × 9 = 9，3 × 3 = 9  
16只有5个因数：1 × 16 = 16，2 × 8 = 16，4 × 4 = 16  
可以看出，非平方数的因数总是成对出现的，只有平方数的因数个数才是奇数，因为平方数除平方根外，其他的因数都是成对出现的！所以**对于每个数字来说，除了平方数，都有偶数个因数。**  
对于当前的开关灯泡问题，可知**到最后处在平方数位置的灯泡一定是开启的，其他位置的灯泡一定是关闭的。**  
下面来详细说明上面的结论。  
例如对于第9个灯泡来说。只有前面的1-9轮有可能会改变这个灯泡的状态这是毫无疑问的，1-9中具体哪几轮会改变灯泡的状态呢？9的所有因素（1，3，9轮）都会改变第9个灯泡的状态。故只需要看9的因素的个数为3，故最后第9个个灯泡一定是打开的。同理对于其他灯泡也一样。可知**到最后处在平方数位置的灯泡一定是开启的，其他位置的灯泡一定是关闭的。**

而要计算一个数之下有多少小于或等于它的平方数，使用一个开平方用的函数就可以了。

清楚上面的思路之后，就非常简单了。

## AC Code

```swift
func bulbSwitch(n: Int) -> Int
{
    return Int(sqrt(Double(n)))
}
```