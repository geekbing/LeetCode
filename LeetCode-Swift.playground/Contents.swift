//: Playground - noun: a place where people can play

func twoSum(nums: [Int], _ target: Int) -> [Int]
{
    // 遍历数组元素
    for i in 0..<nums.count
    {
        for j in (i+1)..<nums.count
        {
            if nums[i] + nums[j] == target
            {
                return [i, j]
            }
        }
    }
    
    return [0, 0]
}

let nums = [2, 7, 11, 15]
twoSum(nums, 9)
