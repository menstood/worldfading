Shader "Menstood/BlendTwoCubemapsWithGlowEdge"
{
    Properties
    {
        _CubemapA("Skybox A", CUBE) = "" {}
        _CubemapB("Skybox B", CUBE) = "" {}

        _DissolveTex("Dissolve Noise (Grayscale)", 2D) = "white" {}
        _DissolveTiling("Dissolve Tiling", Float) = 1.0

        _Feather("Edge Feathering", Range(0, 0.5)) = 0.01
        _FadingFactor("Fading Factor", Float) = 1.0
        _NoiseHardness("Noise Hardness", Range(0, 1)) = 1.0

        _TintA("Tint A", Color) = (1,1,1,1)
        _TintB("Tint B", Color) = (1,1,1,1)

        [HDR] _EdgeGlowColor("Edge Glow Color", Color) = (1, 0.1, 0.1, 1)
        
    }

    SubShader
    {
        Tags { "Queue"="Background" "RenderType"="Opaque" }
        Cull Off ZWrite Off

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            samplerCUBE _CubemapA;
            samplerCUBE _CubemapB;
            sampler2D _DissolveTex;

            float _DissolveTiling;
            float _Feather;
            float _FadingFactor;
            float _NoiseHardness;
            float4 _TintA;
            float4 _TintB;

            float4 _EdgeGlowColor;

            float _WorldFading;

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float3 texcoord : TEXCOORD0;
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD1;
            };

            v2f vert(appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                float3 worldDir = normalize(mul(unity_ObjectToWorld, v.vertex).xyz);
                o.texcoord = worldDir;

                o.uv = worldDir.xz * _DissolveTiling * 0.5 + 0.5;
                return o;
            }
            float inverseLerp (float a, float b, float value)
            {
                return (value - a) / (b - a);
            }

            float fadeMaskFactor(float fade)
            {
                float lower = step(0.001, fade);
                float upper = step(fade, 0.999);
                return lower * upper;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                float3 dir = normalize(i.texcoord);
                float4 colorA = texCUBE(_CubemapA, dir) * _TintA;
                float4 colorB = texCUBE(_CubemapB, dir) * _TintB;

                float viewX = saturate((dir.x + 1.0) * 0.5);
                float t = inverseLerp(0, 1.0, _WorldFading);
                float remapFading = lerp(-1.0, 1.0, t);
                float blendCenter = saturate((remapFading / _FadingFactor) * 0.5 + 0.5);

                float rawNoise = tex2D(_DissolveTex, i.uv).r;
                float noiseStep = step(0.5, rawNoise);
                float dissolve = lerp(rawNoise, noiseStep, _NoiseHardness);

                float fadeMask = fadeMaskFactor(_WorldFading);
                float featherMask = _Feather * fadeMask;
                float blendMask = smoothstep(blendCenter - featherMask, blendCenter + featherMask, viewX - dissolve * featherMask);
                float edgeBand = smoothstep(0.45, 0.5, abs(blendMask - 0.5)); 
                float edgeFade = 1.0 - edgeBand;

                float3 glow = _EdgeGlowColor.rgb  * edgeFade ;

                return lerp(colorB, colorA, blendMask) + float4(glow, 0);
            }
            ENDCG
        }
    }

    FallBack "RenderFX/Skybox"
}
