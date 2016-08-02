---
title: LeetCode-104. Maximum Depth of Binary Tree  
date: 2016-08-02 08:30:01  
categories: Algorithm  
tags: LeetCode  
---

## 104. Maximum Depth of Binary Tree  

Given a binary tree, find its maximum depth.  
The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

## Translation

给定一个二叉树，找到它的最大深度。  
最大深度是沿着最长路径从根节点到最远的叶节点的节点数量。

## The idea of solving process

这是一道最常规的寻找二叉树最大深度的问题。  
使用递归算法即可解决。  
代码非常容易理解。详细代码如下所示：

## AC Code

```javascript
func maxDepth(root: TreeNode?) -> Int
{
    if root == nil
    {
        return 0
    }
    else if root?.left == nil && root?.right == nil
    {
        return 1
    }
    else if root?.left == nil && root?.right != nil
    {
        return maxDepth(root?.right) + 1
    }
    else if root?.left != nil && root?.right == nil
    {
        return maxDepth(root?.left) + 1
    }
    else
    {
        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
}
```