---
title: LeetCode-111. Minimum Depth of Binary Tree  
date: 2016-08-06 21:23:24  
categories: Algorithm  
tags: LeetCode  
---


## 111. Minimum Depth of Binary Tree  

Given a binary tree, find its minimum depth.

The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.

## Translation

给定一个二叉树，找到它的最小深度。最小深度是沿着最短路径从根节点到最近的叶节点的节点数量。

## The idea of solving process

和之前的一题求二叉树的最大深度的题目[104. Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree/)基本完全一致。欢迎访问[博客的解答过程](http://geekbing.com/2016/08/02/LeetCode-104-Maximum-Depth-of-Binary-Tree/)。

完整代码如下所示：

## AC Code

```swift
func minDepth(root: TreeNode?) -> Int
{
    if root == nil
    {
        return 0
    }
    if root?.left == nil
    {
        return minDepth(root?.right) + 1
    }
    if root?.right == nil
    {
        return minDepth(root?.left) + 1
    }
    return min(minDepth(root?.left), minDepth(root?.right)) + 1
}
```