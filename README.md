Barebone Scaffold
===

### Initial repository state
![Initial State](http://yuml.me/diagram/plain/class/[Scaffold]-[Workflow|init;release;clean;],[Workflow]-[Templates|base;development;])

### Post-Init repository state
![Post-Init state](http://yuml.me/diagram/plain;dir:LR/class/[Scaffold]-[Workflow|init;release;clean],[Workflow]-[Templates|base;development;{bg:orange}],[Scaffold]-[Base|.gitattributes;{bg:green}],[Scaffold]-[Development|.gitattributes;{bg:green}],[Templates]->[Development],[Templates]->[Base])

### Post-Release repository state
![Post-Release state](http://yuml.me/diagram/plain;dir:LR/class/[Scaffold]-[Workflow|init;release;clean],[Workflow]-[Templates|base;development],[Scaffold]-[Base|.gitattributes;{bg:orange}],[Scaffold]-[Development|.gitattributes;{bg:orange}],[Scaffold]-[Release{bg:green}],[Release]<-[Development],[Release]<-[Base])

### Post-Clean repository state
![Post-Clean State](http://yuml.me/diagram/plain/class/[Scaffold]-[Workflow|init;release;clean;],[Workflow]-[Templates|base;development;])
