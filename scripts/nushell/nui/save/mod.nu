export def main [filename:string --append(-a) --force(-f)]: string -> nothing {
	$filename | path dirname | mkdir $in
	$in | save --append=$append --force=$force $filename
}
