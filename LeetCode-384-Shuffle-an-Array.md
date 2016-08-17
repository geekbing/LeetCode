---
title: LeetCode-384. Shuffle an Array  
date: 2016-08-17 12:49:46  
categories: Algorithm  
tags:  
- LeetCode  
- Java  
---

## 384. Shuffle an Array  

Shuffle a set of numbers without duplicates.

**Example:**

```
// Init an array with set 1, 2, and 3.
int[] nums = {1,2,3};
Solution solution = new Solution(nums);
	
// Shuffle the array [1,2,3] and return its result. Any permutation of [1,2,3] must equally likely to be returned.
solution.shuffle();
	
// Resets the array back to its original configuration [1,2,3].
solution.reset();
	
// Returns the random shuffling of array [1,2,3].
solution.shuffle();
```

## Translation

将集合中的数字不重复的洗牌。

**例如：**

```
// Init an array with set 1, 2, and 3.
int[] nums = {1,2,3};
Solution solution = new Solution(nums);
	
// Shuffle the array [1,2,3] and return its result. Any permutation of [1,2,3] must equally likely to be returned.
solution.shuffle();
	
// Resets the array back to its original configuration [1,2,3].
solution.reset();
	
// Returns the random shuffling of array [1,2,3].
solution.shuffle();
```

## The idea of solving process

算法思想：**从后向前遍历数组，对于下标为 i 的当前元素，生成一个范围在[0 - i]的随机数 randomNum，将 下标 randomNum 与 i 交换**。

当一个数被选之后，我们是没有必要在下一次随机的时候再考虑它的，因此，我们每次只从可选的数的集合中进行随机，也就不用考虑是否会碰到已经选过的数了，这样子直接将算法的复杂度降了一个数量级。
 
```java
Random rand = new Random();
for(int i = nums.length - 1; i >= 0; i--)
{
	int randomNum = rand.nextInt(i + 1);
	int temp = arr[i];
	arr[i] = arr[randomNum];
	arr[randomNum] = temp;
}
```

完整代码如下所示：

## AC Code

```java
public class Solution 
{
    private int[] nums;
    
    public Solution(int[] nums) 
    {
         this.nums = nums;
    }
    
    /** Resets the array to its original configuration and return it. */
    public int[] reset() 
    {
        return nums;
    }
    
    /** Returns a random shuffling of the array. */
    public int[] shuffle() 
    {
        int[] arr = nums.clone();
        Random rand = new Random();
        for(int i = nums.length - 1; i >= 0; i--)
        {
        	int randomNum = rand.nextInt(i + 1);
        	int temp = arr[i];
        	arr[i] = arr[randomNum];
        	arr[randomNum] = temp;
        }
        return arr;
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * Solution obj = new Solution(nums);
 * int[] param_1 = obj.reset();
 * int[] param_2 = obj.shuffle();
 */
```