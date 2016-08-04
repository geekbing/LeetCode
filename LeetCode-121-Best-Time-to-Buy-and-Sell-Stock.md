---
title: LeetCode-121. Best Time to Buy and Sell Stock  
date: 2016-08-04 14:42:01  
categories: Algorithm  
tags: LeetCode  
---

## 121. Best Time to Buy and Sell Stock  

Say you have an array for which the ith element is the price of a given stock on day i.  

If you were only permitted to complete at most one transaction (ie, buy one and sell one share of the stock), design an algorithm to find the maximum profit.  
**Example 1:**
```
Input: [7, 1, 5, 3, 6, 4]
Output: 5
	
max. difference = 6-1 = 5 (not 7-1 = 6, as selling price needs to be larger than buying price)
```

**Example 2:**
```
Input: [7, 6, 4, 3, 1]
Output: 0
	
In this case, no transaction is done, i.e. max profit = 0.
```

## Translation

给定一个数组，数组的第i个元素是一个股票在第i天的价格。  
如果你只允许最多完成一笔交易(例如，购买和出售股票的一股)，设计一个算法来找到最大的利润。  
**例子 1:**
```
Input: [7, 1, 5, 3, 6, 4]
Output: 5
最大利益 = 6-1 = 5 (而不是 7-1 = 6, 因为销售价格必须大于购买价格)
```

**例子 2:**
```
Input: [7, 6, 4, 3, 1]
Output: 0
在这种情况下，没有交易，即最大利润等于0。
```

## The idea of solving process

使用一个变量 `preProfit` 来表示上一天的最大获利，使用变量 `nowProfit` 来表示今天的最大获利。使用 `max` 来表示最大的获利。
初始情况下，即第一天它们都为0：

```swift
// 上一天的最大获利
var preProfit = 0
// 今天的最大获利
var nowProfit = 0
// 最大获利益
var max = 0
```

故很容易得到下面的公式：

```
今天的最大获利 = 今天的股票价格 － 昨天的股票价格 + 昨天的最大获利
```

需要注意的是：**如果上面的公司求出来的今天的最大获利小于0的话，那么今天的最大获利为0，即不出售股票。**  
如果今天的最大获利大于最大利益，则更新最大利益。  
在进入下一轮循环的时候，将今天的最大获利赋值给昨天的最大获利即可（因为今天相当于明天的上一天）。  
思路比较简单，完整代码如下所示：

## AC Code

```swift
func maxProfit(prices: [Int]) -> Int
{
    if prices.count < 2
    {
        return 0
    }
    // 上一天的最大获利
    var preProfit = 0
    // 今天的最大获利
    var nowProfit = 0
    // 最大获利益
    var max = 0
    
    for i in 1..<prices.count
    {
        nowProfit = preProfit + prices[i] - prices[i - 1]
        if nowProfit > 0
        {
            if nowProfit > max
            {
                max = nowProfit
            }
            // 准备下一轮
            preProfit = nowProfit
        }
        else
        {
            preProfit = 0
        }
    }
    
    return max
}
```