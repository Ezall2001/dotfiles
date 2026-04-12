export def mkdirs [...dirs] {
	$dirs | each {path expand} | mkdir ...$in
}
