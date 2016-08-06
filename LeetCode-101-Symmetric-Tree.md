---
title: LeetCode-101. Symmetric Tree  
date: 2016-08-06 17:15:41  
categories: Algorithm  
tags: LeetCode  
---

## 101. Symmetric Tree  

Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

For example, this binary tree `[1,2,2,3,4,4,3]` is symmetric:

```
    1
   / \
  2   2
 / \ / \
3  4 4  3
```

But the following `[1,2,2,null,3,null,3]` is not:

```
    1
   / \
  2   2
   \   \
   3    3
```

**Note:**  
Bonus points if you could solve it both recursively and iteratively.

## Translation

给定一个二叉树,检查它是不是自己的镜像(即关于中心对称)。  
例如, 二叉树 `[1,2,2,3,4,4,3]` 是对称的:

```
    1
   / \
  2   2
 / \ / \
3  4 4  3
```

但是下面的二叉树 `[1,2,2,null,3,null,3]` 不是中心对称的:

```
    1
   / \
  2   2
   \   \
   3    3
```

**注意：**   
加分点就是如果你能采用递归和迭代两种方式解决它。

## The idea of solving process

与之前的[100. Same Tree](https://leetcode.com/problems/same-tree/)的非常相似，[博客的解答地址](http://geekbing.com/2016/08/02/LeetCode-100-Same-Tree/)。

需要判断二叉树左节点的左节点与二叉树右节点的右节点是否相等；二叉树左节点的右节点与二叉树的右节点的左节点是否相等。

![image](http://diary123.oss-cn-shanghai.aliyuncs.com/20160806/1.png)

完整代码如下所示：

## AC Code

```swift
func check(left: TreeNode?, right: TreeNode?) -> Bool
{
    if left == nil && right == nil
    {
        return true
    }
    if left == nil || right == nil
    {
        return false
    }
    if left?.val == right?.val
    {
        return check(left?.left, right: right?.right) && check(left?.right, right: right?.left)
    }
    return false
}

func isSymmetric(root: TreeNode?) -> Bool
{
    if root == nil
    {
        return true
    }
    return check(root?.left, right: root?.right)
}
```