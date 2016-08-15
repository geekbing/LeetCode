---
title: LeetCode-257. Binary Tree Paths  
date: 2016-08-15 20:47:47  
categories: Algorithm  
tags: 
- LeetCode  
- Java  
---

## 257. Binary Tree Paths

Given a binary tree, return all root-to-leaf paths.

For example, given the following binary tree:

```
   1
 /   \
2     3
 \
  5
```

All root-to-leaf paths are:

```
["1->2->5", "1->3"]
```

## Translation

给定一个二叉树，返回所有根到叶子节点的路径。

例如，给定下面的二叉树：
```
   1
 /   \
2     3
 \
  5
```

所有的根到叶子节点的路径为:

```
["1->2->5", "1->3"]
```

## The idea of solving process

**由于这题暂时不能使用 Swift 来提交代码，所以使用 Java 来编写代码。**  
采用递归的思路来解决这题相对来说比较容易。

1. 如果根节点为空，则返回空的 `List<String>`。

2. 如果根节点的左右子树都为空，则返回只包含根节点的 `List<String>` 即可。

3. 如果根节点的左子树为空，并且右子树不为空。则可以对根节点的右子树先递归调用本函数，得到右子树的所有路径 `List<String> right` 之后，再将根节点添加到 `List<String> right` 中每个元素字符串的开头即可。  
```java
List<String> right = binaryTreePaths(root.right);
for(String str: right)
{
	ans.add(Integer.toString(root.val) + "->" + str);
}			
```

4. 同理如果根节点的左子树不为空，并且右子树为空。则可以对根节点的左子树先递归调用本函数，得到左子树的所有路径 `List<String> left` 之后，再将根节点添加到 `List<String> left` 中每个元素字符串的开头即可。
```java
List<String> left = binaryTreePaths(root.left);
for(String str: left)
{
	ans.add(Integer.toString(root.val) + "->" + str);
}			
```

5. 如果根节点的左右子树都不为空，则同时对根节点的左右子树先递归调用本函数，分别得到左右子树的所有路径 `List<String> left` 和 `List<String> right` 之后，再构造一个新的结果 `List<String> ans`，并分别将根节点和 `List<String> left` 与 `List<String> right` 组合之后添加到 `List<String> ans` 中即可。
```java
List<String> left = binaryTreePaths(root.left);
List<String> right = binaryTreePaths(root.right);
for(String str: left)
{
	ans.add(Integer.toString(root.val) + "->" + str);
}			
for(String str: right)
{
	ans.add(Integer.toString(root.val) + "->" + str);
}
```

完整代码如下所示：

## AC Code

```java
public class Solution 
{
    public List<String> binaryTreePaths(TreeNode root) 
    {
        List<String> ans = new ArrayList<String>();
		if(root == null)
		{
			return ans;
		}
		if(root.left == null && root.right == null)
		{
			ans.add(Integer.toString(root.val));
		}
		else if(root.left == null && root.right != null)
		{
			List<String> right = binaryTreePaths(root.right);
			for(String str: right)
			{
				ans.add(Integer.toString(root.val) + "->" + str);
			}			
		}
		else if(root.left != null && root.right == null)
		{
			List<String> left = binaryTreePaths(root.left);
			for(String str: left)
			{
				ans.add(Integer.toString(root.val) + "->" + str);
			}			
		}
		else
		{
			List<String> left = binaryTreePaths(root.left);
			List<String> right = binaryTreePaths(root.right);
			for(String str: left)
			{
				ans.add(Integer.toString(root.val) + "->" + str);
			}			
			for(String str: right)
			{
				ans.add(Integer.toString(root.val) + "->" + str);
			}
		}
		return ans;
    }
}
```