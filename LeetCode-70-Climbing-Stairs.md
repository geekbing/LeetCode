---
title: LeetCode-70. Climbing Stairs  
date: 2016-08-01 09:26:52  
categories: Algorithm  
tags: LeetCode  
---

### Climbing Stairs

You are climbing a stair case. It takes n steps to reach to the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

### Translation

你正在爬楼梯。需要n步达到顶部。

每次你可以向上爬1或2步。爬到顶部有多少种不同的方法?

### The idea of solving process

记得大学上组合数学讲解递推关系式的时候讲过这道题目。组合数学对于算法题目帮助还是比较大的，学起来也蛮有趣的:)。

对于 `n` 阶楼梯不同方法数我们记为 `S(n)` 显而易见：

当 `n = 0` 时，方法数 `S(0) = 0`
当 `n = 1` 时，方法数 `S(1) = 1`
当 `n = 2` 时，方法数 `S(2) = 2`
当 `n = 3` 时，方法数 `S(3) = 3`

当楼梯有 `n` 阶时，对于第一次迈脚步，我们有两种选择，即：

1. 向上爬1步，这样剩下 `n － 1` 步。方法数为 `S(n － 1)`
2. 向上爬2步，这样剩下 `n － 2` 步。方法数为 `S(n － 2)`

**故，对于 `n` 阶楼梯来说，总的方法数 `S(n) = S(n － 1) ＋ S(n - 2)`**

这样我们就找到了递推关系式，写代码就非常容易了。详细代码如下所示：

### AC CODE

```javascript
func climbStairs(n: Int) -> Int
{
    var ans = [1, 1, 2]
    if n <= 2
    {
        return ans[n]
    }
    for i in 3...n
    {
        ans.append(ans[i - 2] + ans[i - 1])
    }    
    return ans[n]
}
```