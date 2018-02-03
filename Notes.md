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
