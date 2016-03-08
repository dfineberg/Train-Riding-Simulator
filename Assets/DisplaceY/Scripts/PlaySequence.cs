using UnityEngine;
using System.Collections;

public class PlaySequence : MonoBehaviour {

	
	public Texture2D[] Sequence;
	int ImagNum = 0;
	public DisplaceY Dis;
	void Start () {
		InvokeRepeating("PlayImags", 0.01f, 0.1f);
		
	}
	
	// Update is called once per frame
	void PlayImags () {
		Dis.Textur = Sequence[ImagNum];
		ImagNum++;
		if(ImagNum == Sequence.Length)ImagNum=0;
	}
}
