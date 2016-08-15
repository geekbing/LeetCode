---
title: LeetCode-102. Binary Tree Level Order Traversal  
date: 2016-08-15 17:16:40  
categories: Algorithm  
tags: LeetCode  
---

## 102. Binary Tree Level Order Traversal

Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

For example:  
Given binary tree `[3,9,20,null,null,15,7]`,

```
    3
   / \
  9  20
    /  \
   15   7
```

return its level order traversal as:

```
[
  [3],
  [9,20],
  [15,7]
]
```

## Translation

给定一个二叉树，返回二叉树水平层次遍历的节点值(从左到右，逐层返回)。  
例如：给定二叉树 `[3,9,20,null,null,15,7]`,

```
    3
   / \
  9  20
    /  \
   15   7
```

返回它的层次遍历的结果为：

```
[
  [3],
  [9,20],
  [15,7]
]
```

## The idea of solving process

采用递归的思路来解决这题。每遇到新的一层，则在二维数组中增加一行空的数组。

```swift
if level == ans.count
{
	ans.append([])
}
```

并将根节点的值追加到数组的当前层。

```swift
ans[level].append((root?.val)!)
```

接下来就是遍历根节点的下面一层了，层数加 1。递归调用遍历函数，由于是从左到右的顺序，所以先左节点后右节点。

```swift
levelTree(root?.left, level: level + 1, ans: &ans)
levelTree(root?.right, level: level + 1, ans: &ans)
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
            ans.append([])
        }
        ans[level].append((root?.val)!)
        levelTree(root?.left, level: level + 1, ans: &ans)
        levelTree(root?.right, level: level + 1, ans: &ans)
    }
    func levelOrder(root: TreeNode?) -> [[Int]] 
    {
    	var ans = [[Int]]()
    	levelTree(root, level: 0, ans: &ans)
    	return ans
    }
}
```