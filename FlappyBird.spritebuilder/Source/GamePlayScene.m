#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    [self addObstacle];
    timeSinceObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    //Increment the time since the last obsticle
    timeSinceObstacle += delta;
    
    //See if two seconds have passed
    if(timeSinceObstacle>2.0f) {
        
        //Add an obstacle
        [self addObstacle];
        
        //Reset Timer
        timeSinceObstacle = 0.0f;
    }
}

-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    [character flap];
}

@end
