---
title: LeetCode-110. Balanced Binary Tree  
date: 2016-08-14 19:33:59  
categories: Algorithm  
tags: LeetCode  
---

## 110. Balanced Binary Tree  

Given a binary tree, determine if it is height-balanced.

For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

## Translation

给定一个二叉树，判断它是不是高度平衡的。  
对于这个问题，一个高度平衡的二叉树的定义是：二叉树中，每个节点的左右子树的深度相差不会超过1。

## The idea of solving process

解决本题可以采用递归的思路。  
由于题目中涉及到左右子数的高度，所以可以先写一个函数来求一颗二叉树的最大高度。之前做过这样的题目，代码如下：

```swift
func maxHeight(root: TreeNode?) -> Int
{
	if root == nil
	{
		return 0
	}
	return max(maxHeight(root?.left), maxHeight(root?.right)) + 1
}
```

判断是否是高度平衡的二叉树的步骤如下：

1. 首先判断根节点是不是为空。如果根节点为 nil ，则是高度平衡的二叉树。
2. 然后 **递归判断左右子数是否是高度平衡的二叉树**，如果不同时是，则返回 false。
3. 分别求左右子数的高度，判断它们相差是否大于 1，如果大于 1，返回 false；否则返回 true。

完整代码如下所示：

## AC Code

```swift
class Solution 
{
    func maxHeight(root: TreeNode?) -> Int
    {
        if root == nil
        {
            return 0
        }
        return max(maxHeight(root?.left), maxHeight(root?.right)) + 1
    }
    
    func isBalanced(root: TreeNode?) -> Bool 
    {
        if root == nil
        {
            return true
        }
        if !isBalanced(root?.left) || !isBalanced(root?.right)
        {
            return false
        }
        let leftHeight = maxHeight(root?.left) + 1
        let rightHeight = maxHeight(root?.right) + 1
        if abs(leftHeight - rightHeight) > 1
        {
            return false
        }
        return true
    }
}
```