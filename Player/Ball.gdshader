shader_type canvas_item;

uniform vec4 base_color : source_color;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv = UV;
	vec4 t = texture(TEXTURE,uv);
	if(length(uv-0.5) < 0.5){
		COLOR = t * base_color;
	}else{
		discard;
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
