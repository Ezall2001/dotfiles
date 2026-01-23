export def main [row:int type:string state:record] {
	$state.windows
	| where $it.attached != null and $it.attached.type == $type and $it.attached.row == $row
	| first
}
