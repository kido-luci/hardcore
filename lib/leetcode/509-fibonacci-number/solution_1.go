// 1
// ms
// Beats
// 81.25%

func fib(n int) int {
	if n < 2 {
		return n
	}

	pre2 := 0
	pre1 := 1

	for i := 2; i < n+1; i++ {
		newVal := pre1 + pre2
		pre2 = pre1
		pre1 = newVal
	}

	return pre1
}
