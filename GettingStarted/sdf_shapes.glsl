float line(float a, float b, float c, vec2 uv){ 
    // not segment. proper line through the whole screen
    // ax + by = c;
    return a*uv.x + b*uv.y - c;
} 

float circle(float radius, vec2 uv){
    // circle formula: uv.x^2 + uv.y^2 = r^2
    return length(uv) - radius;
}

float segment(vec2 uv, vec2 a, vec2 b, float thickness){
     
     vec2 segment = b-a;
     vec2 point = uv-a;
     
     float squaredMagniture = length(segment)* length(segment);
     
     // between 0 & 1
     float normalised_proj = clamp(dot(point, segment)/squaredMagniture, 0.0, 1.0);
     
    
     vec2 diff_between_projection_and_vector = point - normalised_proj*segment;
     
     
     return length(diff_between_projection_and_vector);//clamp((length(point)-interpolator*length(segment)), 0.0, 1.0);// abs(projection)\, 0.0, 1.0);
}

const vec3 lineColor2 = vec3(0.1,0.0,0.0);

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;
    
    // moving uv to the center of the screen
    uv = uv - 0.5;
    uv = uv * 2.0;
    
    //fix aspect ratio
    uv.x *= iResolution.x/iResolution.y;
    
    float radius = 0.05;
    
    vec3 baseColour = vec3(1.0);
    
    vec2 start = vec2(0.0, 0.5);
    vec2 end = vec2(0.5, 0.5);
    float thickness = 0.0051;

    vec3 color = baseColour;

    float d = 0.0;
    // d = circle(radius, uv);
    // d = line(-2.0, -3.0, -1.0, uv); 
    d = segment(uv, start, end, thickness);
    d = step(0.005, d);

    fragColor = vec4(d, d, d, 1.0);
}