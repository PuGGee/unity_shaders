using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Rigidbody2D))]
public class PlayerShipController : MonoBehaviour {

  public float speed;
  public MapLimits map_limits;

  private Rigidbody2D rigid_body;

	void Awake() {
    rigid_body = GetComponent<Rigidbody2D>();
	}

	void FixedUpdate() {
    // if (Input.GetKey("a") && transform.position.x > map_limits.limit_left) {
    //   rigid_body.velocity = new Vector3(-speed, 0, 0);
    // } else if (Input.GetKey("d") && transform.position.x < map_limits.limit_right) {
    //   rigid_body.velocity = new Vector3(speed, 0, 0);
    // }
    // if (Input.GetKey("w") && transform.position.y < map_limits.limit_top) {
    //   rigid_body.velocity += new Vector3(0, speed, 0);
    // } else if (Input.GetKey("s") && transform.position.y > map_limits.limit_bottom) {
    //   rigid_body.velocity += new Vector3(0, -speed, 0);
    // }
    // if (!(Input.GetKey("a") || Input.GetKey("d") || Input.GetKey("w") || Input.GetKey("s"))) {
    //   rigid_body.velocity = new Vector3(0, 0, 0);
    // }
 	}
}
