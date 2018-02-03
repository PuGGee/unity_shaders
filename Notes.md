# Notes

`SurfaceOutput` structure:

    struct SurfaceOutput {
      fixed3 Albedo;   // diffuse color
      fixed3 Normal;   // tangent space normal, if written
      fixed3 Emission;
      half Specular;   // specular power in 0..1 range
      fixed Gloss;     // specular intensity
      fixed Alpha;     // alpha for transparencies
    }

Input structure:

    float3 viewDir
    float4 COLOR
    floar4 screenPos
    float3 worldPos
    float3 worldRefl
    float3 worldNormal
