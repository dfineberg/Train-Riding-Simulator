// Shader created with Shader Forge v1.24 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.24;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:True,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|diff-7842-OUT;n:type:ShaderForge.SFN_ViewVector,id:9601,x:32127,y:32350,varname:node_9601,prsc:2;n:type:ShaderForge.SFN_Dot,id:4599,x:32362,y:32429,varname:node_4599,prsc:2,dt:0|A-9601-OUT,B-8908-OUT;n:type:ShaderForge.SFN_NormalVector,id:8908,x:32127,y:32514,prsc:2,pt:False;n:type:ShaderForge.SFN_OneMinus,id:7580,x:32538,y:32429,varname:node_7580,prsc:2|IN-4599-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9567,x:32527,y:32620,ptovrint:False,ptlb:sharpness,ptin:_sharpness,varname:_sharpness,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Power,id:3653,x:32705,y:32462,varname:node_3653,prsc:2|VAL-7580-OUT,EXP-9567-OUT;n:type:ShaderForge.SFN_Multiply,id:8634,x:32867,y:32672,varname:node_8634,prsc:2|A-3653-OUT,B-4018-RGB;n:type:ShaderForge.SFN_Color,id:4018,x:32680,y:32648,ptovrint:False,ptlb:node_4018,ptin:_node_4018,varname:_node_4018,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9485294,c2:0.9485294,c3:0.9485294,c4:1;n:type:ShaderForge.SFN_Color,id:4807,x:32127,y:32941,ptovrint:False,ptlb:node_4807,ptin:_node_4807,varname:_node_4807,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.3482759,c3:0.3482759,c4:1;n:type:ShaderForge.SFN_Color,id:25,x:32127,y:32714,ptovrint:False,ptlb:node_25,ptin:_node_25,varname:_node_25,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:1,c3:0.9460001,c4:1;n:type:ShaderForge.SFN_Lerp,id:4112,x:32405,y:32931,varname:node_4112,prsc:2|A-25-RGB,B-4807-RGB,T-9643-OUT;n:type:ShaderForge.SFN_Add,id:7842,x:33015,y:32822,varname:node_7842,prsc:2|A-8634-OUT,B-4112-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:4561,x:31989,y:33171,varname:node_4561,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9643,x:32275,y:33115,varname:node_9643,prsc:2|A-4561-X,B-5699-OUT;n:type:ShaderForge.SFN_Slider,id:5699,x:31948,y:33424,ptovrint:False,ptlb:node_5699,ptin:_node_5699,varname:_node_5699,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;proporder:9567-4018-4807-25-5699;pass:END;sub:END;*/

Shader "Shader Forge/XDirectionGradient01" {
    Properties {
        _sharpness ("sharpness", Float ) = 1
        _node_4018 ("node_4018", Color) = (0.9485294,0.9485294,0.9485294,1)
        _node_4807 ("node_4807", Color) = (1,0.3482759,0.3482759,1)
        _node_25 ("node_25", Color) = (0,1,0.9460001,1)
        _node_5699 ("node_5699", Range(0, 1)) = 1
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float _sharpness;
            uniform float4 _node_4018;
            uniform float4 _node_4807;
            uniform float4 _node_25;
            uniform float _node_5699;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float3 diffuseColor = ((pow((1.0 - dot(viewDirection,i.normalDir)),_sharpness)*_node_4018.rgb)+lerp(_node_25.rgb,_node_4807.rgb,(i.posWorld.r*_node_5699)));
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float _sharpness;
            uniform float4 _node_4018;
            uniform float4 _node_4807;
            uniform float4 _node_25;
            uniform float _node_5699;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 diffuseColor = ((pow((1.0 - dot(viewDirection,i.normalDir)),_sharpness)*_node_4018.rgb)+lerp(_node_25.rgb,_node_4807.rgb,(i.posWorld.r*_node_5699)));
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
