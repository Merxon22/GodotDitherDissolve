shader_type spatial;

uniform float opacity : hint_range(0.0, 1.0) = 1.0;
uniform float dither_scale = 10.0;

const mat4 dither_mat = mat4(
	vec4(1.0/17.0, 9.0/17.0, 3.0/17.0, 11.0/17.0),
	vec4(13.0/17.0, 5.0/17.0, 15.0/17.0, 7.0/17.0),
	vec4(4.0/17.0, 12.0/17.0, 2.0/17.0, 10.0/17.0),
	vec4(16.0/17.0, 8.0/17.0, 14.0/17.0, 6.0/17.0)	
);

void fragment() {
	vec2 uv = FRAGCOORD.xy / dither_scale;
	float dither_value = dither_mat[int(uv.x) % 4][int(uv.y) % 4];
	
	ALPHA = opacity;
	ALPHA_SCISSOR_THRESHOLD = dither_value;
}
