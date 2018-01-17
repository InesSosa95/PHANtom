as yet unclassified
testNestedCFlow2
       | tocalltestcall directCall asp |
       tocalltestcall := PhPointcut new
               receivers: 'PhMockClass';
               selectors: 'toCallTest'.
       directCall := PhPointcut new
               receivers: 'PhMockClass';
               selectors: 'test';
               notInCflowOf: tocalltestcall.

       asp := PhAspect new add:
               (PhAdvice new
                       pointcut: directCall;
                       advice: [:ctx | 'direct'];
                       type: #around).
       [asp install.
       self assert: (PhMockClass new test = 'direct').
       self assert: (PhMockClass new toCallTest = 'test')] ensure: [asp uninstall]