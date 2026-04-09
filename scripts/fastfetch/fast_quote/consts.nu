use ../consts.nu [STATE_DIR]

export const URL = 'https://api.animechan.io/v1/quotes/random'
export const STATE_FILE = $STATE_DIR | path join 'animechan.json'

export const DEFAULT_QUOTE = {
	body: 'What are you looking for here. Your life is the saddest quote of all !'
	character: 'A deep voice'
	source: null
}

export const FOOTER_RIGHT_OFFSET = 5
