---
title: LeetCode-46. Permutations  
date: 2016-08-10 15:42:32  
categories: Algorithm  
tags: LeetCode   
---

## 46. Permutations  

Given a collection of `distinct` numbers, return all possible permutations.

For example,  
`[1,2,3]` have the following permutations:

```
[
  [1,2,3],
  [1,3,2],
  [2,1,3],
  [2,3,1],
  [3,1,2],
  [3,2,1]
]
```

## Translation

给定一个互不相同的数据的集合，返回所有可能的排列。
例如,  `[1,2,3]` 有下面的这些排列。

```
[
  [1,2,3],
  [1,3,2],
  [2,1,3],
  [2,3,1],
  [3,1,2],
  [3,2,1]
]
```

## The idea of solving process

记得组合数学课上讲过生成全排列的方法。下面举例如何生成 `[1,2,3]` 的全排列：  
首先，取第一个元素 1，得到

```
1
```

然后在 1 的前后插入 2，得到

```
1 2
2 1
```

然后在能插入的地方插入 3

```
1 2 3
1 3 2
3 1 2
2 1 3
2 3 1
3 2 1
```

通过这种规则不断迭代直到生成 n 个元素的全排列。  
思路就是这样，完整代码如下所示：

## AC Code

```swift
func permute(nums: [Int]) -> [[Int]]
{
    var temp = [[Int]]()
    var ans = [[nums[0]]]
    
    for i in 1..<nums.count
    {
        for j in 0..<ans.count
        {
            let ansRow = ans[j]
            for k in 0...ansRow.count
            {
                var newRow = ansRow
                newRow.insert(nums[i], atIndex: k)
                temp.append(newRow)
            }
        }
        ans = temp
        temp.removeAll()
    }
    
    return ans
}
```