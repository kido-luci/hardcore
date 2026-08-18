
// 0
// ms
// Beats
// 100.00%

func tribonacci(n int) int {
	switch n {
	case 0:
		return 0
	case 1:
		return 1
	case 2:
		return 1
	}

	t0 := 0
	t1 := 1
	t2 := 1

	for i := 3; i < n+1; i++ {
		t2, t1, t0 = t2+t1+t0, t2, t1
	}

	return t2
}
