---
title: LeetCode-226. Invert Binary Tree  
date: 2016-08-02 11:20:07  
categories: Algorithm  
tags: LeetCode  
---

## 226. Invert Binary Tree  

Invert a binary tree.

```
     4
   /   \
  2     7
 / \   / \
1   3 6   9
```
to
```
     4
   /   \
  7     2
 / \   / \
9   6 3   1
```

**Trivia:**
This problem was inspired by [this original tweet](https://twitter.com/mxcl/status/608682016205344768) by [Max Howell](https://twitter.com/mxcl):

>Google: 90% of our engineers use the software you wrote ([Homebrew](http://brew.sh/)), but you can’t invert a binary tree on a whiteboard so fuck off.

## Translation

反转二叉树。

```
     4
   /   \
  2     7
 / \   / \
1   3 6   9
```
反转为：
```
     4
   /   \
  7     2
 / \   / \
9   6 3   1
```
**花絮：**

这道题目灵感来源于 [Max Howell](https://twitter.com/mxcl) 的 [这个最初的推文](https://twitter.com/mxcl/status/608682016205344768) :

>谷歌：我们90%的工程师使用你写的软件([Homebrew](http://brew.sh/))，但是你却不能在白板上反转二叉树，所以滚蛋吧。

## The idea of solving process

非常简单的递归算法。上过数据结构课程的应该还记得怎么写。  
代码非常简单，交换左右分支的时候，先用变量保存即可。

```javascript
let temp = invertTree(root?.left)
root?.left = invertTree(root?.right)
root?.right = temp
```

## AC Code

```javascript
func invertTree(root: TreeNode?) -> TreeNode?
{
    if root == nil
    {
        return nil
    }
    
    let temp = invertTree(root?.left)
    root?.left = invertTree(root?.right)
    root?.right = temp
    return root
}
```