as yet unclassified
adviceCollection: anAdviceCollection
	adviceCollection := anAdviceCollection.
	beforeAdvice := (anAdviceCollection select: [:adv | adv type = #before]) asArray.
	aroundAdvice := (anAdviceCollection select: [:adv | adv type = #around]) asArray.
	afterAdvice := (anAdviceCollection select: [:adv | adv type = #after]) asArray reversed.