A deployment aspect that instantiates and deploys one aspect for each instantiation of an object of the class pattern. The aspect instance is sent the targetmethod message with argument the object just instantiated so it can keep track of it.

See PhPerObjExampleAspect for an example