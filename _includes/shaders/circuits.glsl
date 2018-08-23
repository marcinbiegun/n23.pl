#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

const float pi = 3.14159265359;


#define texture(s, uv) vec4(0.0)
#define textureLod(s, uv, lod) vec4(0.0)

#define time (1000.0+(time*0.1))

// --------- [ original shadertoy ] ----------
// https://www.shadertoy.com/view/XlX3Rj

#define width .005
float zoom = .18;
float shape=0.;
vec3 color=vec3(0.),randcol;


void formula(vec2 z, float c) {
  float timeRate = 5.0;

	float minit=0.;
	float o,ot2,ot=ot2=1000.;
	for (int i=0; i<9; i++) {
		z=abs(z)/clamp(dot(z,z),.1,.5)-c;
		float l=length(z);
		o=min(max(abs(min(z.x,z.y)),-l+.25),abs(l-.25));
		ot=min(ot,o);
		ot2=min(l*.1,ot2);
		minit=max(minit,float(i)*(1.-abs(sign(ot-o))));
	}
	minit+=1.;
	float w=width*minit*2.;
	float circ=pow(max(0.,w-ot2)/w,6.);
	shape+=max(pow(max(0.,w-ot)/w,.25),circ);
	vec3 col=normalize(.1+texture(iChannel1,vec2(minit*.1)).rgb);
	color+=col*(.4+mod(minit/9.-(time*timeRate)+ot2*2.,1.)*1.6);
	color+=vec3(1.,.7,.3)*circ*(10.-minit)*3.*smoothstep(0.,.5,.15+texture(iChannel0,vec2(.0,1.)).x-.5);
}

// --------[ Original ShaderToy ends here ]---------- //





void main( void ) {

	//vec2 isf_FragNormCoord = ( gl_FragCoord.xy / resolution.xy ) - vec2(0.5,0.5);
	vec2 isf_FragNormCoord = ( gl_FragCoord.xy / resolution.xy );
	//float a = 0.1*time;
	//gl_FragColor = vec4(final,1.0);

  vec4 fragCoord = gl_FragCoord;
  vec2 iResolution = resolution;

	vec2 pos = fragCoord.xy / iResolution.xy - .5;
	pos.x*=iResolution.x/iResolution.y;
	vec2 uv=pos;
	float sph = length(uv); sph = sqrt(1. - sph*sph)*1.5; // curve for spheric distortion
	uv=normalize(vec3(uv,sph)).xy;
	float a=time+mod(time,1.)*.5;
	vec2 luv=uv;
	float b=a*5.48535;

  // Move camera
	zoom*=1.+sin(time*3.758123)*.8;
  float rate = 0.2;
	uv*=mat2(cos(b*rate),sin(b*rate),-sin(b*rate),cos(b*rate));
	uv+=vec2(sin(a),cos(a*.5))*0.2;

	uv*=zoom;
	float pix=.5/iResolution.x*zoom/sph;
	float dof=max(1.,(10.-mod(time,1.)/.01));
	float c=1.5+mod(floor(time),6.)*.125;
	for (int aa=0; aa<36; aa++) {
		vec2 aauv=floor(vec2(float(aa)/6.,mod(float(aa),6.)));
		formula(uv+aauv*pix*dof,c);
	}
	shape/=36.; color/=36.;
	vec3 colo=mix(vec3(.15),color,shape)*(1.-length(pos))*min(1.,abs(.5-mod(time+.5,1.))*10.);
	colo*=vec3(1.2,1.1,1.0);
  colo *= 0.6;
	gl_FragColor = vec4(colo,1.0);
}
</script>

