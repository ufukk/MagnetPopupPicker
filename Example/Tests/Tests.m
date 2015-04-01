SPEC_BEGIN(InitialTests)

describe(@"My initial tests", ^{
    
    context(@"will fail", ^{
        
        it(@"can do maths", ^{
            [[@1 should] equal:@1];
        });
        
        it(@"can read", ^{
            [[@"number" should] equal:@"number"];
        });
        
    });
    
    context(@"will pass", ^{
        
        it(@"can do maths", ^{
            [[@1 should] beGreaterThan:@0];
        });
        
        it(@"can read", ^{
            [[@"team" shouldNot] containString:@"I"];
        });  
    });
    
});

SPEC_END