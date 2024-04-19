shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv = UV;
	vec4 t = texture(TEXTURE,uv);
	if(length(uv-0.3) < 0.08){
		COLOR = smoothstep(t+0.6,t-0.2,t);
	}else{
		discard;
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
