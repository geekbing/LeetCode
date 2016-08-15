---
title: LeetCode-107. Binary Tree Level Order Traversal II  
date: 2016-08-15 17:18:52  
categories: Algorithm  
tags: LeetCode  
---

## 107. Binary Tree Level Order Traversal II

Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).

For example:  
Given binary tree `[3,9,20,null,null,15,7]`,

```
    3
   / \
  9  20
    /  \
   15   7
```

return its bottom-up level order traversal as:

```
[
  [15,7],
  [9,20],
  [3]
]
```

## Translation

给定一个二叉树，返回自底向上的顺序层次遍历节点的值。(从左到右，一级一级从叶到根遍历)。

例如:  
给定二叉树 `[3,9,20,null,null,15,7]`,

```
    3
   / \
  9  20
    /  \
   15   7
```

返回它的从底向上层次遍历的结果为：

```
[
  [15,7],
  [9,20],
  [3]
]
```

## The idea of solving process

和上一题 [104. Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree/) 十分类似。之前[博客的解答地址](http://geekbing.com/2016/08/15/LeetCode-102-Binary-Tree-Level-Order-Traversal/)只是之前是从上向下的顺序，现在是从下向上。思路基本一致，都采用递归的思想，但又有所区别。

由于遍历的顺序是倒着的，所以每遇到新的一行，都需要向二维数组的最前面插入一行空的数组。

```swift
if level == ans.count
{
	ans.insert([], atIndex: 0)
}
```

然后递归调用函数遍历下一层，层数加1，由于下一层的遍历顺序是从左向右，所以先左节点，再右节点。

```swift
levelTree(root?.left, level: level + 1, ans: &ans)
levelTree(root?.right, level: level + 1, ans: &ans)
```

最关键的地方在于，根节点的值应当插在哪一层上面？由于是倒叙的，所以应当是数组中的层数减去当前层数。

```swift
ans[ans.count - 1 - level].append((root?.val)!)
```

完整代码如下所示：

## AC Code

```swift
class Solution 
{
    func levelTree(root: TreeNode?, level: Int, inout ans: [[Int]])
    {
        if root == nil
        {
            return
        }
        if level == ans.count
        {
            ans.insert([], atIndex: 0)
        }
        levelTree(root?.left, level: level + 1, ans: &ans)
        levelTree(root?.right, level: level + 1, ans: &ans)
        ans[ans.count - 1 - level].append((root?.val)!)
    }
    func levelOrderBottom(root: TreeNode?) -> [[Int]] 
    {
        var ans = [[Int]]()
        levelTree(root, level: 0, ans: &ans)
        return ans
    }
}
```