An example of per-object deployment. The following produces the array { 1 . 1 . 0}

| dep m1 m2 m3 |
dep := PhPerObjDeployAspect onClassPattern: 'PhMockClass class' instantiate: PhPerObjExampleAspect targetmethod: #target:.
m1 := PhMockClass new.
m2 := PhMockClass new.
dep uninstall.
m3 := PhMockClass new.
m1 plus.
{(m1 counter) . (m2 counter) . (m3 counter)} inspect
