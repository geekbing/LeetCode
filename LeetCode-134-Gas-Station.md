---
title: LeetCode-134. Gas Station  
date: 2016-08-15 09:29:01  
categories: Algorithm  
tags: LeetCode  
---

## 134. Gas Station  

There are N gas stations along a circular route, where the amount of gas at station i is gas[i].

You have a car with an unlimited gas tank and it costs cost[i] of gas to travel from station i to its next station (i+1). You begin the journey with an empty tank at one of the gas stations.

Return the starting gas station's index if you can travel around the circuit once, otherwise return -1.

## Translation

沿着圆形的路上有N个加油站，在第 i 个加油站的汽油总量为 gas[i]。  
你有一辆可以装无限汽油的车。在旅途中从加油站 i 到达加油站（i + 1），你需要花费 cost[i] 的汽油。初始情况下你的车没有汽油，你在一个加油站开始了你的旅途。
如果你能环形一次，返回开始加油站的索引；否则返回－1。

## The idea of solving process

如果你是一位老司机（:)）假设从站点 i 出发，到达站点 k 之前，依然能保证油箱里油没见底儿，从k 出发后，见底儿了。那么就说明 diff[i] + diff[i+1] + … + diff[k] < 0，而除掉diff[k]以外，从diff[i]开始的累加都是 >= 0的。也就是说diff[i] 也是 >= 0的，这个时候我们还有必要从站点 i + 1尝试吗？仔细一想就知道：车要是从站点 i+1出发，到达站点k后，甚至还没到站点k，油箱就见底儿了，因为少加了站点 i 的油。。。   
因此，当我们发现到达k 站点邮箱见底儿后，i 到 k 这些站点都不用作为出发点来试验了，肯定不满足条件，只需要从k+1站点尝试即可！
下面是一个重要的结论：  
**对于一个循环数组，如果这个数组整体和 sum >= 0，那么必然可以在数组中找到这么一个元素：从这个数组元素出发，绕数组一圈，能保证累加和一直是出于非负状态。**

我们模拟一下过程： 

1. 最开始，站点0是始发站，假设车开出站点p后，油箱空了，假设sum1 = diff[0] + diff[1] + … + diff[p]，可知sum1 < 0； 
2. 根据上面的论述，我们将p+1作为始发站，开出q站后，油箱又空了，设sum2 = diff[p+1] +diff[p+2] + … + diff[q]，可知sum2 < 0。 
3. 将q+1作为始发站，假设一直开到了未循环的最末站，油箱没见底儿，设sum3 = diff[q+1] +diff[q+2] + … + diff[size-1]，可知sum3 >= 0。 

要想知道车能否开回 q 站，其实就是在sum3 的基础上，依次加上 diff[0] 到 diff[q]，看看sum3在这个过程中是否会小于0。但是我们之前已经知道 diff[0] 到 diff[p-1] 这段路，油箱能一直保持非负，因此我们只要算算sum3 + sum1是否 < 0，就知道能不能开到 p+1 站了。   
如果能从p+1站开出，只要算算sum3 + sum1 + sum2 是否 < 0，就知都能不能开回q站了。   
因为 sum1, sum2 都 < 0，因此如果 sum3 + sum1 + sum2 >= 0 那么sum3 + sum1 必然 >= 0，也就是说，只要sum3 + sum1 + sum2 >=0，车必然能开回q站。而sum3 + sum1 + sum2 其实就是 diff数组的总和 Total，遍历完所有元素已经算出来了。 
　　
因此 Total 能否 >= 0，就是是否存在这样的站点的 充分必要条件。 

完整代码如下所示：

## AC Code

```swift
func canCompleteCircuit(gas: [Int], _ cost: [Int]) -> Int
{
    var total = 0
    var left = 0
    var ans = 0
    for i in 0..<gas.count
    {
        left += gas[i] - cost[i]
        total += gas[i] - cost[i]
        if left < 0
        {
            ans = i + 1
            left = 0
        }
    }
    if total >= 0
    {
        return ans
    }
    return -1
}
```