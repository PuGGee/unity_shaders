Shader "Holistic/Lambert" {

  Properties {
       _colour ("Colour", Color) = (1,1,1,1)
       _SpecColour ("Spec Colour", Color) = (1,1,1,1)
       _spec ("Spec", Float) = 0.5
       _gloss ("Gloss", Float) = 0.5
  }

  SubShader {
    Tags{
      "Queue" = "Geometry"
    }

    CGPROGRAM
      #pragma surface surf Lambert

      fixed4 _colour;
      half _spec;
      float _gloss;

      struct Input {
        float3 viewDir;
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
