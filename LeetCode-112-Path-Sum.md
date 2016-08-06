---
title: LeetCode-112. Path Sum  
date: 2016-08-06 20:43:57  
categories: Algorithm  
tags: LeetCode  
---

## 112. Path Sum  

Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.

For example:  
Given the below binary tree and `sum = 22`,

```
              5
             / \
            4   8
           /   / \
          11  13  4
         /  \      \
        7    2      1
```

return true, as there exist a root-to-leaf path `5->4->11->2` which sum is 22.

## Translation

给定一个二叉树和一个和 sum，判断二叉树是否有从根到叶子节点的路径，把所有沿路径的叶子节点的值相加和等于给定的总和 sum 。  
例如：给定下面的二叉树并且和 `sum = 22`,

```
              5
             / \
            4   8
           /   / \
          11  13  4
         /  \      \
        7    2      1
```

返回true, 因为存在从根到叶子节点的路径 `5->4->11->2` 它的和是22。

## The idea of solving process

采用递归的思路来解决这道题目非常容易。  
从根节点开始遍历，遍历到当前节点，将当前节点的值从总和中减去之后，只需要递归判断剩下的子树是否存在路径和等于剩下的值即可。  
找到路径的条件是，当前的节点为叶子节点，并且当前的值等于最后剩下的值即可。

```swift
if root?.val == sum && root?.left == nil && root?.right == nil
{
	return true
}
```

完整代码如下所示：

## AC Code

```swift
func hasPathSum(root: TreeNode?, _ sum: Int) -> Bool
{
    if root == nil
    {
        return false
    }
    if root?.val == sum && root?.left == nil && root?.right == nil
    {
        return true
    }
    // 递归判断左右子数是否存在路径和等于 sum - (root?.val)!
    return hasPathSum(root?.left, sum - (root?.val)!) || hasPathSum(root?.right, sum - (root?.val)!)
}
```