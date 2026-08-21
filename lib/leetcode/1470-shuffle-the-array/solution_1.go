// 5
// ms
// Beats
// 63.52%

// func shuffle(nums []int, n int) []int {
// 	result := []int{}

// 	for i := 0; i < n; i++ {
// 		result = append(result, nums[i], nums[n+i])
// 	}

// 	return result
// }

// 0
// ms
// Beats
// 100.00%

func shuffle(nums []int, n int) []int {
	result := make([]int, 2*n)

	for i := 0; i < n; i++ {
		result[2*i] = nums[i]
		result[2*i+1] = nums[n+i]
	}

	return result
}
