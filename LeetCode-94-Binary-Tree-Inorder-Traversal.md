---
title: LeetCode-94. Binary Tree Inorder Traversal  
date: 2016-08-09 09:16:24  
categories: Algorithm  
tags: LeetCode  
---

## 94. Binary Tree Inorder Traversal  

Given a binary tree, return the *inorder* traversal of its nodes' values.
For example:  
Given binary tree `[1, null, 2, 3]`,
```
   1
    \
     2
    /
   3
```
return `[1, 3, 2]`.  
**Note:** Recursive solution is trivial, could you do it iteratively?

## Translation

给定一个二叉树，返回中序遍历的所有节点的值。  
例如：给定二叉树 `[1, null, 2, 3]`,

```
   1
    \
     2
    /
   3
```

返回 `[1, 3, 2]` 。  
**注意：** 递归的解决方案是微不足道的，你能使用迭代来解决这题吗?

## The idea of solving process

上一篇博客[二叉树的先序遍历](http://localhost:4000/2016/08/09/LeetCode-144-Binary-Tree-Preorder-Traversal/)中对算法的思路已经讲解得非常详细了，这里不再叙述。  
详细代码如下所示：

## AC Code

递归遍历：

```swift
func inorderTraversal(root: TreeNode?) -> [Int] 
{
    var ans = [Int]()
    if root == nil
    {
        return []
    }
    let leftArr = inorderTraversal(root?.left)
    let rightArr = inorderTraversal(root?.right)
    
    ans.appendContentsOf(leftArr)
    ans.append((root?.val)!)
    ans.appendContentsOf(rightArr)
	
    return ans
}
```

迭代遍历：

```swift
func inorderTraversal(root: TreeNode?) -> [Int]
{
    if root == nil                      // 排除特殊情况
    {
        return []
    }
    var stack = [(TreeNode?, Bool)]()   // 使用数组模仿栈
    var ans = [Int]()                   // 将要返回的结果数组
    stack.append((root, false))         // 先将根节点入栈
    while !stack.isEmpty
    {
        let node = stack.last?.0        // 获取栈顶元素
        let visited = (stack.last?.1)!
        stack.removeLast()              // 栈顶元素出栈
        if node == nil
        {
            continue
        }
        if visited
        {
            ans.append((node?.val)!)
        }
        else
        {   // 入栈顺序将决定遍历顺序
            stack.append((node?.right, false))
            stack.append((node, true))
            stack.append((node?.left, false))
        }
    }
    return ans
}
```

