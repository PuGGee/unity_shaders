Shader "Holistic/Toon" {

  Properties {
       _colour ("Colour", Color) = (1,1,1,1)
       _rampTex ("Ramp Texture", 2D) = "white" {}
  }

  SubShader {
    Tags{
      "Queue" = "Geometry"
    }

    CGPROGRAM
      #pragma surface surf Toon

      sampler2D _rampTex;

      float4 LightingToon (SurfaceOutput s, half3 lightDir, fixed atten) {
        float diff = dot (s.Normal, lightDir);
        float h = diff * 0.5 + 0.5;
        float2 rh = h;
        float3 ramp = tex2D(_rampTex, rh).rgb;

        float4 c;
        c.rgb = s.Albedo * _LightColor0.rgb * (ramp);
        c.a = s.Alpha;
        return c;
      }

      fixed4 _colour;

      struct Input {
        float3 viewDir;
      };

      void surf (Input IN, inout SurfaceOutput o){
        o.Albedo = _colour.rgb;
      }

    ENDCG
  }

  FallBack "Diffuse"
}
