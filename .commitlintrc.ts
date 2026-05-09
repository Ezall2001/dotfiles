import type { UserConfig } from '@commitlint/types'
import { RuleConfigSeverity } from '@commitlint/types'

const RCS = RuleConfigSeverity

let rules: UserConfig['rules'] = {
	'body-leading-blank': [RCS.Error, 'always'],
	'body-empty': [RCS.Warning, 'never'],
	'body-max-line-length': [RCS.Error, 'always', 72],
	'footer-leading-blank': [RCS.Warning, 'always'],
	'footer-max-line-length': [RCS.Error, 'always', 72],
	'header-max-length': [RCS.Error, 'always', 72],
	'header-trim': [RCS.Error, 'always'],
	'subject-empty': [RCS.Error, 'never'],
	'scope-case': [
		RCS.Error,
		'always',
		{
			cases: ['lowercase', 'snake-case'],
			delimiters: ['+'],
		},
	],
	'scope-delimiter-style': [RCS.Error, 'always', ['+']],
	'type-case': [RCS.Error, 'always', 'lower-case'],
	'type-empty': [RCS.Error, 'never'],
	'type-enum': [
		RCS.Error,
		'always',
		['chore', 'ci', 'feat', 'fix', 'perf', 'refactor', 'style'],
	],
}

let config: UserConfig = {
	extends: [],
	parserPreset: {
		name: 'conventional-changelog-conventionalcommits',
		parserOpts: {
			commentChar: '#',
		},
	},
	formatter: '@commitlint/format',
	rules: rules,
	ignores: [],
	defaultIgnores: true,
	helpUrl: 'help yourself',
}

export default config
