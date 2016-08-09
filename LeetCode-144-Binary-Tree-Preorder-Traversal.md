---
title: LeetCode-144. Binary Tree Preorder Traversal  
date: 2016-08-09 09:15:54  
categories: Algorithm  
tags: LeetCode  
---

## 144. Binary Tree Preorder Traversal  

Given a binary tree, return the *preorder* traversal of its nodes' values.  
For example:  
Given binary tree `{1,#,2,3}`,
```
   1
    \
     2
    /
   3
```
return `[1,2,3]`.  
**Note:** Recursive solution is trivial, could you do it iteratively?

## Translation

给定一个二叉树，返回先序遍历的所有节点的值。  
例如：给定二叉树 `{1,#,2,3}`，

```
   1
    \
     2
    /
   3
```

返回 `[1,2,3]`。  
**注意：** 递归的解决方案是微不足道的，你能使用迭代来解决这题吗?

## The idea of solving process

大学数据结构中讲解过的二叉树的遍历现在也已经忘记的差不多了。现在徒手写代码也只能非常轻松的写出递归遍历的方法。递归遍历的代码如最下面的代码所示，由于递归遍历比较简单，不详细展开叙述。

> 下面的更简单的非递归遍历二叉树的方法来源于 [简书作者紫松](http://www.jianshu.com/p/49c8cfd07410)。非常棒的一篇博客，对二叉树新的遍历方法讲解得非常透彻，并且三种遍历的方法非常统一，也适用于其他遍历方式。

**更简单的非递归遍历二叉树的方法**  
这里我给出统一的实现思路和代码风格的方法，完成对二叉树的三种非递归遍历。

```swift
// 更简单的非递归先序遍历
func preorderTraversal(root: TreeNode?) -> [Int]
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
            stack.append((node?.left, false))
            stack.append((node, true))
        }
    }
    return ans
}
```

```swift
// 更简单的非递归中序遍历
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

```swift
// 更简单的非递归后序遍历
func postorderTraversal(root: TreeNode?) -> [Int]
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
            stack.append((node, true))
            stack.append((node?.right, false))
            stack.append((node?.left, false))
        }
    }
    return ans
}
```

以上三种遍历实现代码行数一模一样，如同递归遍历一样，只有三行核心代码的先后顺序有区别。为什么能产生这样的效果？下面我将会介绍。

统一三种更简单的非递归遍历方法的基本思想：**有重合元素的局部有序一定能导致整体有序。**
如下这段序列，局部`2 3 4`和局部`1 2 3`都是有序的，但是不能由此保证整体有序。

![image](http://diary123.oss-cn-shanghai.aliyuncs.com/20160809/1.png)

而下面这段序列，局部`2 3 4, 4 5 6, 6 8 10`都是有序的，而且相邻局部都有一个重合元素，所以保证了序列整体也是有序的。

![image](http://diary123.oss-cn-shanghai.aliyuncs.com/20160809/2.png)

**应用于二叉树**
基于这种思想，我就构思三种非递归遍历的统一思想：不管是前序，中序，后序，只要我能保证对每个结点而言，该结点，其左子结点，其右子结点都满足以前序/中序/后序的访问顺序,整个二叉树的这种三结点局部有序一定能保证整体以前序/中序/后序访问，因为相邻的局部必有重合的结点，即一个局部的“根”结点是另外一个局部的“子”结点。

如下图，对二叉树而言，将`每个框内结点集都看做一个局部`，那么局部有`A, A B C, B D E, D,E, C F, F`，并且可以发现`每个结点元素都是相邻的两个局部的重合结点`。发觉这个是非常关键的，因为知道了重合结点，就可以对一个局部排好序后，通过取出一个重合结点过渡到与之相邻的局部进行新的局部排序。我们可以用栈来保证局部的顺序（排在顺序前面的后入栈，排在后面的先入栈，保证这个局部元素出栈的顺序一定正确），然后通过栈顶元素(重合元素)过渡到对新局部的排序，对新局部的排序会导致该重合结点再次入栈，所以当栈顶出现已完成过渡使命的结点时，就可以彻底出栈输出了（而这个输出可以保证该结点在它过渡的那个局部一定就是排在最前面的），而新栈顶元素将会继续完成新局部的过渡。当所有结点都完成了过渡使命时，就全部出栈了，这时我敢保证所有局部元素都是有序出栈，而相邻局部必有重合元素则保证了整体的输出一定是有序的。这种思想的好处是将**算法与顺序分离**，定义何种顺序并不影响算法，算法只做这么一件事：**将栈顶元素取出，使以此元素为“根”结点的局部有序入栈，但若此前已通过该结点将其局部入栈，则直接出栈输出即可。**

![image](http://diary123.oss-cn-shanghai.aliyuncs.com/20160809/3.png)

从实现的程序中可以看到：三种非递归遍历唯一不同的就是局部入栈的三行代码的先后顺序。所以不管是`根->左->右`，`左->根->右`，`左->右->根`，甚至是`根->右->左`，`右->根->左`，`右->左->根`定义的新顺序，算法实现都无变化，除了改变局部入栈顺序。

值得一提的是，对于前序遍历，大家可能发现取出一个栈顶元素，使其局部前序入栈后，栈顶元素依然是此元素，接着就要出栈输出了，所以使其随局部入栈是没有必要的，其代码就可以简化为下面的形式。

```swift
func preorderTraversal(root: TreeNode?) -> [Int]
{
    if root == nil                      // 排除特殊情况
    {
        return []
    }
    var ans = [Int]()                   // 将要返回的结果数组
    var stack = [TreeNode?]()           // 使用数组模仿栈
    stack.append(root!)                 // 先将根节点入栈
    while !stack.isEmpty
    {
        let node = stack.last!          // 取出栈顶元素
        stack.removeLast()
        if node == nil
        {
            continue
        }
        else
        {
            ans.append((node?.val)!)
            stack.append(node?.right)
            stack.append(node?.left)
        }
    }
    return ans
}
```


## AC Code

递归遍历：

```swift
func preorderTraversal(root: TreeNode?) -> [Int]
{
    var ans = [Int]()
    if root == nil
    {
        return []
    }
    let leftArr = preorderTraversal(root?.left)
    let rightArr = preorderTraversal(root?.right)
    
    ans.append((root?.val)!)
    ans.appendContentsOf(leftArr)
    ans.appendContentsOf(rightArr)
    
    return ans
}
```

迭代遍历：

```swift
func preorderTraversal(root: TreeNode?) -> [Int]
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
            stack.append((node?.left, false))
            stack.append((node, true))
        }
    }
    return ans
}
```