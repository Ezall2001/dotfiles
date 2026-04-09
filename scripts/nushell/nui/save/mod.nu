export def main [filename:string --append(-a) --force(-f)]: any -> nothing {
	$filename | path dirname | mkdir $in
	$in | save --append=$append --force=$force $filename
}
