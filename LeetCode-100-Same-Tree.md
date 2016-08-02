---
title: LeetCode-100. Same Tree  
date: 2016-08-02 13:18:44  
categories: Algorithm  
tags: LeetCode  
---

## 100. Same Tree  

Given two binary trees, write a function to check if they are equal or not.  
Two binary trees are considered equal if they are structurally identical and the nodes have the same value.

## Translation

给定两个二叉树，编写一个函数来判断它们是否相等。如果两个二叉树在结构上是相同的，并且所有的节点有相同的值，则它们被认为是相等的。

## The idea of solving process

又是一题经典的递归程序。  
如果当前节点的值相等，则递归调用当前函数判断两个二叉树的左分支和右分支是否分别相等即可。  
需要注意的是，如果两个节点都为空，则返回true。如果两个节点值不相等，则返回false。  
详细代码如下所示：

## AC Code

```javascript
func isSameTree(p: TreeNode?, _ q: TreeNode?) -> Bool
{
    if p == nil && q == nil
    {
        return true
    }
    else if p?.val == q?.val
    {
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
    else
    {
        return false
    }
}
```