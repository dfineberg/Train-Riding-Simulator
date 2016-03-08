using UnityEngine;
using System.Collections;

public class DisplaceY : MonoBehaviour {

	public float MaxHeight = 1;
	public bool AnimatDisplacment;
	Texture2D textur;
	RenderTexture RendTexture;
	MovieTexture MovTextur;
	
	public Texture Textur;
	
	bool RenTxr;
	
	Mesh mesh;
	Vector3[] OrgVrtx;
	Vector3[] ModVrtx;
	Vector3[] OrgNor;
	Vector2[] uvs;

	
    void Start() {
        mesh = GetComponent<MeshFilter>().mesh;
        OrgVrtx = mesh.vertices;
        ModVrtx = mesh.vertices;
        uvs = mesh.uv;
        OrgNor = mesh.normals;
        
		if(!Textur){
	        if(GetComponent<Renderer>().material.mainTexture.GetType() == typeof(RenderTexture)){
       			RendTexture = (RenderTexture)GetComponent<Renderer>().material.mainTexture;
       			textur = new Texture2D(RendTexture.width, RendTexture.height);
				RenderTexture.active = RendTexture;
				textur.ReadPixels(new Rect(0, 0, RendTexture.width, RendTexture.height), 0, 0);
				textur.Apply();
	       		RenTxr = true;
    	   	}else if(GetComponent<Renderer>().material.mainTexture.GetType() == typeof(MovieTexture)){
    	   		MovTextur = (MovieTexture)GetComponent<Renderer>().material.mainTexture;
    	   		MovTextur.Play();
    	   	}else{
       			textur = (Texture2D)GetComponent<Renderer>().material.mainTexture;
        	}
		}else{
	        if(Textur.GetType() == typeof(RenderTexture)){
       			RendTexture = (RenderTexture)Textur;
       			textur = new Texture2D(RendTexture.width, RendTexture.height);
				RenderTexture.active = RendTexture;
				textur.ReadPixels(new Rect(0, 0, RendTexture.width, RendTexture.height), 0, 0);
				textur.Apply();
	       		RenTxr = true;
    	   	}else if(Textur.GetType() == typeof(MovieTexture)){
    	   		MovTextur = (MovieTexture)Textur;
    	   		MovTextur.Play();
    	   	}else{
       			textur = (Texture2D)Textur;
        	}
		}
        
        if(AnimatDisplacment){
        	InvokeRepeating("Animat", 0.05f, 0.05f);
        }
        
        int i = 0;
        while (i < uvs.Length) {
            uvs[i].x *= textur.width;
            uvs[i].y *= textur.height;
            
            ModVrtx[i] = OrgVrtx[i] + (textur.GetPixel((int)uvs[i].x, (int)uvs[i].y).grayscale * MaxHeight * OrgNor[i]);
            i++;
        }
        mesh.vertices = ModVrtx;
        mesh.RecalculateNormals();
    }
    
    
    void Animat(){
		if(RenTxr){
			RenderTexture.active = RendTexture;
			textur.ReadPixels(new Rect(0, 0, RendTexture.width, RendTexture.height), 0, 0);
			textur.Apply();
		}else if(Textur){
			textur = (Texture2D)Textur;
		}else{
			textur = (Texture2D)GetComponent<Renderer>().material.mainTexture;
		}
    	int i = 0;
    	
        while (i < uvs.Length) {
            ModVrtx[i] = OrgVrtx[i] + (textur.GetPixel((int)uvs[i].x, (int)uvs[i].y).grayscale * MaxHeight * OrgNor[i]);
            i++;
        }
    	mesh.vertices = ModVrtx;
    	mesh.RecalculateNormals();
    }
}
