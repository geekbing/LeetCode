---
title: LeetCode-189. Rotate Array  
date: 2016-07-30 20:33:32  
categories: Algorithm  
tags: LeetCode  
---

### 189. Rotate Array

Rotate an array of n elements to the right by k steps.

For example, with n = 7 and k = 3, the array `[1，2，3，4，5，6，7]` is rotated to `[5，6，7，1，2，3，4]`.

Note:
Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.

**Hint:**

Could you do it in-place with O(1) extra space?

Related problem: [Reverse Words in a String II](https://leetcode.com/problems/reverse-words-in-a-string-ii/)

### 题目翻译

将一个有着n个元素的数组向右旋转k步。

例如：当 n = 7 并且 k = 3, 对于数组 `[1，2，3，4，5，6，7]` 向右旋转之后为 `[5，6，7，1，2，3，4]` 。

**注意：**

试图想出尽可能多的解决方案，至少有三种不同的方法来解决这道问题。

**提示：**

你能想到空间复杂度为O(1)的解决方案吗?

相关问题: [Reverse Words in a String II](https://leetcode.com/problems/reverse-words-in-a-string-ii/)

### 解题思路

初步看题目，不算太难。但是需要注意一些特殊的情况，例如：

1. **当数组元素小于等于1时，此时不需要处理，直接返回即可。**
2. **当k为数组元素个数的整数倍时，此时不需要处理，直接返回即可。**

当k大于数组元素个数的时候，向右移动k步与向右移动 `k % nums.count` 的效果是一样的

```javascript
let step = k % nums.count
```

向右移动k步，即与向左移动 `nums.count - k % nums.count` 的效果也是一样的。

```javascript
let step = nums.count - k % nums.count
```

**方案一：**

为了从左向右循环的方便，将向右移动k转换为向左移动step步。

```javascript
let step = nums.count - k % nums.count
```

这样循环的时候，就可以从左向右扫描数组元素了。将数组元素分为2部分。

1. 先将数组中下标为0～k-1的元素用数组存储起来。防止被覆盖。
2. 然后循环`0...(nums.count - 1 - step)`，将当前元素用当前元素右边第k个元素的值覆盖。
3. 最后循环`(nums.count - step)..<nums.count`，将当前元素用第一步保存的对应的元素值覆盖

这样就完成了整体向左移动step（即向右移动k步）。

**方案二：**

同样将向右移动k步转换为向左移动step步。

1. 先将数组前step个元素反转
2. 再将数组后面的 `nums.count - step` 个元素反转
3. 最后将数组整体反转

这样同样能够达到将数组整体向左移动step（即向右移动k步）。

理解思路之后，代码基本没有难度，两种方案的代码如下：

### AC Code

```javascript
func rotate(inout nums: [Int], _ k: Int)
{
    // 排除特殊情况
    if k % nums.count == 0 || nums.count <= 1
    {
        return
    }

    // 左移动
    let step = nums.count - k % nums.count
    
    // 先保留前k个数组元素
    var saveArr = [Int]()
    for i in 0..<step
    {
        saveArr.append(nums[i])
    }
    
    for i in 0...(nums.count - 1 - step)
    {
        nums[i] = nums[i + step]
    }
    
    for i in (nums.count - step)..<nums.count
    {
        nums[i] = saveArr[i + step - nums.count]
    }
}
```

方案二：

```javascript
// 反转数组
func revertArr(inout arr: [Int], start: Int, end:Int)
{
    var i = start
    var j = end
    while i <= j
    {
        let temp = arr[i]
        arr[i] = arr[j]
        arr[j] = temp
        
        i += 1
        j -= 1
    }
}

func rotate(inout nums: [Int], _ k: Int)
{
    if (nums.count <= 1) || (k % nums.count == 0)
    {
        return
    }
    let step = nums.count - k % nums.count
    revertArr(&nums, start: 0, end: step - 1)
    revertArr(&nums, start: step, end: nums.count - 1)
    revertArr(&nums, start: 0, end: nums.count - 1)
}
```
