---
title: LeetCode-350. Intersection of Two Arrays II  
date: 2016-08-01 13:56:42  
categories: Algorithm  
tags: LeetCode  
---

### 350. Intersection of Two Arrays II  

Given two arrays, write a function to compute their intersection.

**Example:**
Given nums1 = `[1, 2, 2, 1]`, nums2 = `[2, 2]`, return `[2, 2]`.

**Note:**
Each element in the result should appear as many times as it shows in both arrays.
The result can be in any order.  

**Follow up:**

+ What if the given array is already sorted? How would you optimize your algorithm?
+ What if nums1's size is small compared to nums2's size? Which algorithm is better?
+ What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?

### Translation

给定两个数组，写一个函数来计算他们的交集。

**例如：**  
给定 nums1 = `[1, 2, 2, 1]`, nums2 = `[2, 2]`, 返回 `[2, 2]`.

**Note:**  

+ 结果中的每一个元素出现的次数都应该和两个数组中出现的次数一样。
+ 返回的结果中的元素可以是任意的顺序。

### The idea of solving process

和[349. Intersection of Two Arrays](https://leetcode.com/problems/intersection-of-two-arrays/)题只是返回交集的元素的个数稍有不同。大家可以看我之前[博客的解题思路](http://geekbing.com/2016/08/01/LeetCode-349-Intersection-of-Two-Arrays/)

使用一个空的数组 `ans` 存储数组 `nums1` 和 `nums2` 的交集。
**首先分别使用字典存储 `nums1` 与 `nums2` 的数字的种类和对应的次数。**

以 `nums1` 举例说明，对于 `nums2` 同样如此。代码如下：

```javascript
var dict1: [Int: Int] = [:]
for num in nums1
{
	if dict1[num] == nil
	{
		dict1[num] = 1
	}
	else
	{
		dict1[num]! += 1
	}
}
```

接着就是从两个字典｀dict1｀ 和 ｀dict2｀ 中查找交集了。交集使用数组 `ans` 保存。 

对于字典 `dict1` 的每一个 `key` ，如果 `dict2[key]` 为空，则说明 `key` 不是交集，跳过即可；  
如果 `dict2[key]` 不为空，则对于 `key` ，交集 `key` 的个数为 `dict1[key]` 和 `dict2[key]` 的最小值。  
对于其他元素也是同样处理。

完整代码如下所示：

### AC Code

```javascript
func intersect(nums1: [Int], _ nums2: [Int]) -> [Int]
{
    var ans = [Int]()
    var dict1: [Int: Int] = [:]
    var dict2: [Int: Int] = [:]
    for num in nums1
    {
        if dict1[num] == nil
        {
            dict1[num] = 1
        }
        else
        {
            dict1[num]! += 1
        }
    }
    for num in nums2
    {
        if dict2[num] == nil
        {
            dict2[num] = 1
        }
        else
        {
            dict2[num]! += 1
        }
    }
    for key in dict1.keys
    {
        if dict2[key] != nil
        {
            let times:Int = (dict1[key] < dict2[key] ? dict1[key] : dict2[key])!
            for _ in 0..<times
            {
                ans.append(key)
            }
        }
    }
    return ans
}
```