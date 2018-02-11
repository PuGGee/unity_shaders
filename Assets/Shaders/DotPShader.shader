Shader "Holistic/DotP" {

  // Properties {
  //      _colour ("Colour", Color) = (1,1,1,1)
  //      _shine ("Shine Intensity", Float) = 1
  // }

  SubShader {

    CGPROGRAM
      #pragma surface surf Lambert

      // fixed4 _colour;
      // float _shine;

      struct Input {
        float3 viewDir;
      };

      void surf (Input IN, inout SurfaceOutput o){
          half dotp = dot(IN.viewDir, o.Normal);
          o.Albedo = float3(dotp, 0, 0);
      }

    ENDCG
  }

  FallBack "Diffuse"
}
