import "sort"

func asteroidsDestroyed(mass int, asteroids []int) bool {
	sort.Ints(asteroids)

	for _, e := range asteroids {
		if mass < e {
			return false
		}
		// if mass == e { return i == len(asteroids)-1 }

		mass += e
	}

	return true
}
