using UnityEngine;
using System.Collections;

public class Move : MonoBehaviour {

    float speed, targetLifetime, lifetime;
    Vector3 direction;

    void Update()
    {
        transform.Translate(direction * speed * Time.deltaTime);
        lifetime += Time.deltaTime;

        if(lifetime >= targetLifetime)
        {
            Destroy(gameObject);
        }
    }

    public void Init(Vector3 direction, float speed, float lifetime)
    {
        targetLifetime = lifetime;
        this.speed = speed;
        this.direction = direction.normalized;
    }
}
