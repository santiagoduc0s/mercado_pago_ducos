lint:
	fvm dart fix --apply
	fvm dart format .
	fvm flutter analyze