Shader "Holistic/ShinyShader" {

  Properties {
       _colour ("Colour", Color) = (1,1,1,1)
       _shine ("Shine Intensity", Float) = 1
  }

  SubShader {

    CGPROGRAM
      #pragma surface surf Lambert

      fixed4 _colour;
      float _shine;

      struct Input {
        float3 worldRefl;
      };

      void surf (Input IN, inout SurfaceOutput o){
          o.Albedo = _colour.rgb - (float3(IN.worldRefl.z, IN.worldRefl.z, IN.worldRefl.z) * _shine);
      }

    ENDCG
  }

  FallBack "Diffuse"
}
