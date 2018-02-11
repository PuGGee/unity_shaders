using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpinScript : MonoBehaviour {

  public int spinAmount;

	void Update () {
    transform.rotation *= Quaternion.Euler(0, spinAmount, 0);
	}
}
