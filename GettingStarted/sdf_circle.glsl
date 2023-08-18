void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;
    
    // moving uv to the center of the screen
    uv = uv - 0.5;
    uv = uv * 2.0;
    
    //fix aspect ratio
    uv.x *= iResolution.x/iResolution.y;
    
    float radius = 0.3;//5*iResolution.y;
    
    vec4 baseColour = vec4(1.0);
    
    // circle formula: x^2 + y^2 = r^2
    float x = uv.x;
    float y = uv.y;
    
    float d = length(vec2(x, y)) - radius;

    fragColor = d > 0.0 ? baseColour : vec4(1.0, 0.0, 0.0, 1.0);
}