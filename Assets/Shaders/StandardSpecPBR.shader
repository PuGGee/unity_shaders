Shader "Holistic/StandardSpecPBR" {

  Properties {
      _colour ("Colour", Color) = (1,1,1,1)
      _metallicTex ("Metallic Tex", 2D) = "white" {}
      _specColour ("Spec Colour", Color) = (1,1,1,1)
  }

  SubShader {
    Tags{
      "Queue" = "Geometry"
    }

    CGPROGRAM
      #pragma surface surf StandardSpecular

      fixed4 _colour;
      fixed4 _specColour;
      sampler2D _metallicTex;
      half _metallic;


      struct Input {
        float2 uv_metallicTex;
      };

      void surf (Input IN, inout SurfaceOutputStandardSpecular o){
          o.Albedo = _colour.rgb;
          o.Smoothness = tex2D(_metallicTex, IN.uv_metallicTex).r;
          o.Specular = _specColour.rgb;
      }

    ENDCG
  }

  FallBack "Diffuse"
}
