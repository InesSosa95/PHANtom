# PHANtom
An aspect language for Pharo Smalltalk
By Johan Fabry and Daniel Galdames

  ## Summary

In the context of our research on Aspect-Oriented Programming, we have a need for a modern and powerful aspect language for Smalltalk. Current aspect languages for Smalltalk however fall short on various points. To address this deficit, we elected to design and build PHANtom: a modern aspect language for Pharo Smalltalk. PHANtom is designed to be an aspect language in the spirit of Smalltalk: dynamic, simple, and powerful. PHANtom is a modern aspect language because it incorporates the best features of languages that precede it, includes recent research results in aspect interactions and reentrancy control, and is designed from the onset to be optimized and compiled where possible. In this paper, we present the latest version of the language and give examples and patterns of use.

  ## Instalation
Execute in playground: 

 ```smalltalk
 Metacello
	new
		baseline: 'Phantom';
		repository: 'github://InesSosa95/PHANtom:master';
		load
  ```
  
  
  ## More Information
  
 * [Paper](http://repositorio.uchile.cl/bitstream/handle/2250/126672/PHANtom-a-modern-aspect-language-for-Pharo-Smalltalk.pdf?sequence=1&isAllowed=y)
  
 * [Original paper in Spanish](http://repositorio.uchile.cl/tesis/uchile/2011/cf-galdames_dg/pdfAmont/cf-galdames_dg.pdf)
