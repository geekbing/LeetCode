---
title: LeetCode-235. Lowest Common Ancestor of a Binary Search Tree  
date: 2016-08-15 15:51:06  
categories: Algorithm  
tags: LeetCode  
---

## 235. Lowest Common Ancestor of a Binary Search Tree  

Given a binary search tree (BST), find the lowest common ancestor (LCA) of two given nodes in the BST.

According to the [definition of LCA on Wikipedia](https://en.wikipedia.org/wiki/Lowest_common_ancestor): “The lowest common ancestor is defined between two nodes v and w as the lowest node in T that has both v and w as descendants (where we allow a node to be a descendant of itself).”

```
        _______6______
       /              \
    ___2__          ___8__
   /      \        /      \
   0      _4       7       9
         /  \
         3   5
```

For example, the lowest common ancestor (LCA) of nodes `2` and `8` is `6`. Another example is LCA of nodes `2` and `4` is `2`, since a node can be a descendant of itself according to the LCA definition.

## Translation

给定一个二叉搜索树(BST)，找到两个给定节点在BST中的最低共同祖先(LCA)。

根据 LCA [在维基百科的定义](https://en.wikipedia.org/wiki/Lowest_common_ancestor)：“在二叉树 T 中，两个节点 v 和 w 的最低共同祖先是指二叉树中拥有 v 和 w 节点作为后代节点的最低节点(我们允许一个节点本身作为自己的后代）。”

## The idea of solving process

**由于这题暂时不能使用 Swift 来提交代码，所以使用 Java 来编写代码。**

采用递归的思路来解决这题比较简单。二叉搜索树的特性为：根节点的左子树的节点值永远小于右子树节点值。查找的基本思路如下：

1. 如果子数 p 和 q 分布在根节点的两边，说明最低共同祖先肯定是根节点。
2. 如果子数 p 和 q 都分布在根节点的左边，说明最低共同祖先肯定在根节点的左子树里面。故递归调用函数，求p, q在根节点的左子树中的最低共同祖先即可。
3. 同理，如果子数 p 和 q 都分布在根节点的右边，则递归调用函数，求p, q在根节点的右子树中的最低共同祖先即可。

完整代码如下所示：

## AC Code

```java
public class Solution 
{
    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) 
    {
        if ((root.val >= p.val && root.val <= q.val) || (root.val <= p.val && root.val >= q.val))
    	{
    		return root;
    	}
    	if (root.val > p.val && root.val > q.val)
    	{
    		return lowestCommonAncestor(root.left, p, q);
    	}
    	if (root.val < p.val && root.val < q.val)
    	{
    		return lowestCommonAncestor(root.right, p, q);
    	}
    	return root;
    }
}
```