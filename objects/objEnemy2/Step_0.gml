event_inherited();

speed = moveSpeed;
image_angle = direction;

direction = startDirection + 30 * sin(waveCount);
waveCount += 0.05;