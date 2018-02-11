Shader "Holistic/CustomBlinn" {

  Properties {
       _colour ("Colour", Color) = (1,1,1,1)
  }

  SubShader {
    Tags{
      "Queue" = "Geometry"
    }

    CGPROGRAM
      #pragma surface surf CustomBlinn

      half4 LightingCustomBlinn (SurfaceOutput s, half3 lightDir, half3 viewDir, half atten) {
        half3 h = normalize (lightDir + viewDir);

        half diff = max (0, dot (s.Normal, lightDir));

        float nh = max (0, dot (s.Normal, h));
        float spec = pow (nh, 48.0);

        half4 c;
        c.rgb = (s.Albedo * _LightColor0.rgb * diff + _LightColor0.rgb * spec) * atten;
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
