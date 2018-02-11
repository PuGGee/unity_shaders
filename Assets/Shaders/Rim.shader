Shader "Holistic/Rim" {

  Properties {
       _colour ("Rim Colour", Color) = (1,1,1,1)
       // _shine ("Shine Intensity", Float) = 1
  }

  SubShader {

    CGPROGRAM
      #pragma surface surf Lambert

      fixed4 _colour;
      // float _shine;

      struct Input {
        float3 viewDir;
      };

      void surf (Input IN, inout SurfaceOutput o){
          half rim = saturate(dot(normalize(IN.viewDir), o.Normal));
          o.Albedo = _colour.rgb * rim < 0.5 ? (1 - rim * 2) : 0;
      }

    ENDCG
  }

  FallBack "Diffuse"
}
