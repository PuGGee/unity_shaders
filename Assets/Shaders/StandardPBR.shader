Shader "Holistic/StandardPBR" {

  Properties {
      _colour ("Colour", Color) = (1,1,1,1)
      _metallicTex ("Metallic Tex", 2D) = "white" {}
      _metallic ("Metallic", Range(0, 1)) = 0.0
  }

  SubShader {
    Tags{
      "Queue" = "Geometry"
    }

    CGPROGRAM
      #pragma surface surf Standard

      fixed4 _colour;
      sampler2D _metallicTex;
      half _metallic;

      struct Input {
        float2 uv_metallicTex;
      };

      void surf (Input IN, inout SurfaceOutputStandard o){
          o.Albedo = _colour.rgb;
          o.Smoothness = tex2D(_metallicTex, IN.uv_metallicTex).r;
          o.Metallic = _metallic;
      }

    ENDCG
  }

  FallBack "Diffuse"
}
