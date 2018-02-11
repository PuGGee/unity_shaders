Shader "Holistic/ShinyBumpMapped" {

  Properties {
       _diffuse ("Diffuse Texture", 2D) = "white" {}
       _diffuseMult ("Diffuse Multiplier", Range(0, 10)) = 1
       _normalTex ("Normal Texture", 2D) = "bump" {}
       _normalMult ("Normal Multiplier", Range(0, 10)) = 1
       _cubeMap ("Example Cube", CUBE) = "white" {}
       _cubeMult ("Cube Map Multiplier", Range(0, 10)) = 1
  }

  SubShader {

    CGPROGRAM
      #pragma surface surf Lambert

      sampler2D _diffuse;
      half _diffuseMult;
      sampler2D _normalTex;
      half _normalMult;
      samplerCUBE _cubeMap;
      half _cubeMult;

      struct Input {
        float2 uv_diffuse;
        float2 uv_normalTex;
        float3 worldRefl; INTERNAL_DATA
      };

      void surf (Input IN, inout SurfaceOutput o){
          o.Albedo = tex2D(_diffuse, IN.uv_diffuse).rgb * _diffuseMult;
          o.Normal = UnpackNormal(tex2D(_normalTex, IN.uv_normalTex));
          o.Normal *= float3(_normalMult, _normalMult, 1);
          o.Emission = texCUBE(_cubeMap, WorldReflectionVector(IN, o.Normal)).rgb * _cubeMult;
      }

    ENDCG
  }

  FallBack "Diffuse"
}
