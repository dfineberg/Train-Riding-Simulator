using UnityEngine;
using System.Collections;

public class GUIScroll : MonoBehaviour {

	public DisplaceY Dis;
	void Start () {
		Dis = GetComponent<DisplaceY>();
	}
	
	// Update is called once per frame
	void OnGUI () {
		Dis.MaxHeight = GUI.HorizontalSlider(new Rect(25, 25, 200, 30), Dis.MaxHeight, 0.0F, 0.05F);
	}
}
