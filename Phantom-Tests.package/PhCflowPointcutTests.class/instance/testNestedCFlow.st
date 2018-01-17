as yet unclassified
testNestedCFlow
       | tocalltestcall nestedtestcall testcall asp |
       tocalltestcall := PhPointcut new
               receivers: 'PhMockClass';
               selectors: 'toCallTest'.
       nestedtestcall := PhPointcut new
               receivers: 'PhMockClass';
               selectors: 'test';
               inCflowOf: tocalltestcall.
       testcall := PhPointcut new
               receivers: 'PhMockClass';
               selectors: 'test'.
       asp := PhAspect new add:
               (PhAdvice new
                       pointcut: (testcall & (nestedtestcall not));
                       advice: [:ctx | 'direct'];
                       type: #around).
       [asp install.
       self assert: (PhMockClass new test = 'direct').
       self assert: (PhMockClass new toCallTest = 'test')] ensure: [asp uninstall]