private
getPointcuts
	| pcs |
	pcs := Set new.
	self adviceCollection do: [:adv |
		pcs addAll: adv pointcut getPointcuts].
	^ pcs