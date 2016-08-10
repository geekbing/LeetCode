---
title: LeetCode-62. Unique Paths  
date: 2016-08-10 19:56:00  
categories: Algorithm  
tags: LeetCode   
---

## 62. Unique Paths  

A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

How many possible unique paths are there?

![image](http://diary123.oss-cn-shanghai.aliyuncs.com/20160810/1.png)

Above is a 3 x 7 grid. How many possible unique paths are there?

**Note:** m and n will be at most 100.

## Translation

一个机器人位于 m x n 网格的左上角(下图中标记为 "Start" 的地方)。  
机器人在任何时候只能向下或者向右移动。机器人正在试图到达网格的右下角(下图中标记为 "Finish" 的地方)。  
有多少种可能的不同的路径?  
![image](http://diary123.oss-cn-shanghai.aliyuncs.com/20160810/1.png)  
以上是 3 x 7 的网格。有多少种不同的路径?  
**注意：** m 和 n 不大于100。

## The idea of solving process

由于存在机器人在任何时候只能向下或向右移动的限制。所以对于每一步，机器人要么向右移动，要么向下移动。  
记 S(m, n)为机器人从 m x n 网格的左上角到达右下角的不同方法数。则:  
若机器人第一步向右移动，剩下（m, n - 1）的网格，剩下网格的方法数为 S(m, n - 1)  
若机器人第一步向下移动，剩下（m - 1, n）的网格，剩下网格的方法数为 S(m - 1, n)  
故很容易得到：`S(m, n) = S(m － 1, n) + S(m, n － 1) `  
初始条件： `S(m, 1) = 1`， `S(1, n) = 1`  
清楚递推关系式之后，写程序就不难了，（**注意，如果采用递归的方式会超时**）。  
完整代码如下所示。

## AC Code

```swift
func uniquePaths(m: Int, _ n: Int) -> Int
{
	// 排除特殊情况
    if m == 1 || n == 1
    {
        return 1
    }
    // 初始化数组
    var path = Array(count: m, repeatedValue: Array(count: n, repeatedValue: 0))
    for i in 0..<path.count
    {
        path[i][0] = 1
    }
    for j in 0..<path[0].count
    {
        path[0][j] = 1
    }
    
    for row in 1..<m
    {
        for col in  1..<n
        {
            path[row][col] = path[row - 1][col] + path[row][col - 1]
        }
    }
    return path[m - 1][n - 1]
}
```