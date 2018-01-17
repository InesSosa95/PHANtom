as yet unclassified
getInfoExample
	| pc adv asp |
	"Transcript open."
	Transcript show: 'Demo without aspect installed'; cr; cr.
	PhantomDemoClass go.
	pc := PhPointcut new
	receivers: 'PhantomDemoClass';
	localSelectors: #any asParser star;
	context: #(#receiver #arguments #proceed #selector).
	adv := PhAdvice new
		pointcut: pc;
		type: #around;
		advice: [:context |
			| result |
			Transcript show: 'Intercepted message: ', context selector asString; cr.
			Transcript show: 'in: ', context receiver class name asString; cr.
			Transcript show: 'parameters: ', context arguments asString; cr.
			Transcript show: 'Running original method:'; cr.
			 result := context proceed.
			Transcript show: 'result: ', result asString; cr.
			result].

		asp := PhAspect new.
		asp add: adv.
		[
		asp install. 
		Transcript show: 'Demo with installed aspect'; cr;cr.
		PhantomDemoClass go.
		] ensure: [asp uninstall]