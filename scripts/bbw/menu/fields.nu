def key_getter [...keys] {
	{|item| $item | get ($keys | into cell-path) }
}

def address_getter [] {
	{|item:record|
		let idy = $item.identity
		[
			$idy.address1
			$"($idy.city), ($idy.state), ($idy.postalCode)"
			$idy.country
		] | str join "\n"
	}
}

def expiration_getter [] {
	{|item|
		$'($item.card.expMonth)/($item.card.expYear)'
	}
}

export def FIELDS_MAP [] {
	[
		[ # LOGIN
			{label:username getter:(key_getter login username)}
			{label:password getter:(key_getter login password)}
		]
		[ # SECURE NOTE
			{label:note getter:(key_getter notes)}
		]
		[ # CARD
			{label:holder getter:(key_getter card cardholderName)}
			{label:number getter:(key_getter card number)}
			{label:expiration getter:(expiration_getter)}
			{label:code getter:(key_getter card code)}
		]
		[ # IDENTITY
			{label:address getter: (address_getter)}
			{label:ssn getter:(key_getter identity ssn)}
			{label:passport getter: (key_getter identity passportNumber)}
			{label:email getter:(key_getter identity email)}
			{label:phone getter:(key_getter identity phone)}
		]
		[ # SSH KEY
			{label:private getter: (key_getter sshKey privateKey)}
			{label:public getter:(key_getter sshKey publicKey)}
			{label:fingerprint getter: (key_getter sshKey keyFingerprint)}
		]
	]
}
