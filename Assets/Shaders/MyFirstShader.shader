﻿Shader "Holistic/HelloShader" {

	Properties {
	     _myColour ("Example Colour", Color) = (1,1,1,1)
	     _myCube ("Example Cube", CUBE) = "" {}
	     _myVector ("Example Vector", Vector) = (0.5,0.5,0.5,0.5)

	     _myFloat ("Colour Intensity", Float) = 0.5
	     _myTex ("Diffuse Texture", 2D) = "white" {}
	     _normalTex ("Normal Texture", 2D) = "bump" {}
	     _normalMult ("Normal Multiplier", Range(0, 10)) = 1
	}

	SubShader {

		CGPROGRAM
			#pragma surface surf Lambert

			fixed4 _myColour;
			half _myRange;
			sampler2D _myTex;
			samplerCUBE _myCube;
			float _myFloat;
			float4 _myVector;

			sampler2D _normalTex;
			half _normalMult;

			struct Input {
				float2 uv_myTex;
				float2 uv_normalTex;
			};

			void surf (Input IN, inout SurfaceOutput o){
			    o.Albedo = (tex2D(_myTex, IN.uv_myTex) + _myColour * _myFloat).rgb;
			    o.Normal = UnpackNormal(tex2D(_normalTex, IN.uv_normalTex));
			    o.Normal *= float3(_normalMult, _normalMult, 1);
			}

		ENDCG
	}

	FallBack "Diffuse"
}
