baselines
baseline: spec
	<baseline>

	spec for: #'squeakCommon' do: [
		spec package: 'Gettext'.
		spec group: 'default' with: #('Gettext' ). ].

	spec for: #'gemstone' do: [
		spec package: 'Gettext-Gemstone'.
		spec group: 'default' with: #('Gettext-GemStone' ). ].
