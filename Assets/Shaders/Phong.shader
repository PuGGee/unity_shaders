Shader "Holistic/Phong" {

  Properties {
       _colour ("Colour", Color) = (1,1,1,1)
       _SpecColor ("Spec Colour", Color) = (1,1,1,1)
       _spec ("Spec", Range(0, 1)) = 0.5
       _gloss ("Gloss", Range(0, 1)) = 0.5
  }

  SubShader {
    Tags{
      "Queue" = "Geometry"
    }

    CGPROGRAM
      #pragma surface surf BlinnPhong

      float4 _colour;
      half _spec;
      fixed _gloss;

      struct Input {
        float3 uv_MainTex;
      };

      void surf (Input IN, inout SurfaceOutput o){
          o.Albedo = _colour.rgb;
          o.Specular = _spec;
          o.Gloss = _gloss;
      }

    ENDCG
  }

  FallBack "Diffuse"
}
