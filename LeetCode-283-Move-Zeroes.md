---
title: LeetCode-283. Move Zeroes  
date: 2016-08-02 11:53:49  
categories: Algorithm  
tags: LeetCode  
---

## 283. Move Zeroes  

Given an array `nums`, write a function to move all `0's` to the end of it while maintaining the relative order of the non-zero elements.

For example, given `nums = [0, 1, 0, 3, 12]`, after calling your function, `nums` should be `[1, 3, 12, 0, 0]`.

**Note:**

1. You must do this **in-place** without making a copy of the array.  
2. Minimize the total number of operations.

## Translation

给定一个数组 `nums`, 写一个函数把所有值为0的元素移动到数组的末尾，并且保持非零元素的相对顺序。  
例如：给定数组 `nums = [0, 1, 0, 3, 12]`, 在调用你的函数之后, 数组 `nums` 应当变为 `[1, 3, 12, 0, 0]`。

**注意：**

1. 你必须只使用原来的数组来解决这道题目，你不能重新创建一个数组的副本。
2. 减少操作的总数。

## The idea of solving process

第一个方法就是：**遍历数组，如果遇到值为0的元素，那么直接删除该元素，然后在数组末尾追加一个值为0的元素即可。** 这种思路的解法详见下面的方法一所示。

第二个方法就是：**使用一个变量 `j` 来记录数组最前面新赋值的非0元素的个数。遍历数组的时候，当遇到非0的元素，那么就把当前位置的元素赋值给 `j` 位置，同时 `j` 向后移动一位，即： `j += 1` 。这样循环结束时，数组最前面 `j` 个元素全部都是非0元素了。最后将数组后半部全部赋值为0即可。** 这种思路的解法详见下面的方法二所示。

## AC Code

方法一：

```javascript
func moveZeroes(inout nums: [Int])
{
    if nums.count < 2
    {
        return
    }
    var index = 0
    var count = 0
    
    while index < nums.count && count < nums.count
    {
        if nums[index] == 0
        {
            nums.append(0)
            nums.removeAtIndex(index)
        }
        else
        {
            index += 1
        }
        count += 1
    }
}
```

方法二：

```javascript
func moveZeroes(inout nums: [Int])
{
    var j = 0
    for i in 0..<nums.count
    {
        if nums[i] != 0
        {
            nums[j] = nums[i]
            j += 1
        }
    }
    while j < nums.count
    {
        nums[j] = 0
        j += 1
    }
}
```

