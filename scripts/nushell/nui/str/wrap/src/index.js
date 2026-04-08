import { program } from 'commander'
import wrap_ansi from 'wrap-ansi'

program.argument('<text>').argument('<width>')

const main = () => {
	program.parse()
	const text = program.args[0]
	const width = program.args[1]

	let res = wrap_ansi(text, width, {
		hard: true,
		trim: true,
		wordWrap: true,
	})

	console.log(res)
}

main()
