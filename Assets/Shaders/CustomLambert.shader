Shader "Holistic/CustomLambert" {

  Properties {
       _colour ("Colour", Color) = (1,1,1,1)
  }

  SubShader {
    Tags{
      "Queue" = "Geometry"
    }

    CGPROGRAM
      #pragma surface surf CustomLambert

      half4 LightingCustomLambert (SurfaceOutput s, half3 lightDir, half atten) {
        half NdotL = dot (s.Normal, lightDir);
        half4 c;
        c.rgb = s.Albedo * _LightColor0.rgb * (NdotL * atten);
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
