using UnityEngine;
using System.Collections;

[System.Serializable]
public class PointInfo
{
    public Transform point;
    public bool reversed;
}

[System.Serializable]
public class Tileset
{
    public PointInfo[] points;
    public GameObject[] tilePrefabs;
    public float scrollSpeed = 1f, lifetime = 10f, frequency = 10f;
    public float rotation, reversedRotation;
}

public class Spawner : MonoBehaviour {

    public Tileset[] tilesets;


    void Start()
    {
        foreach(Tileset tileset in tilesets)
        {
            StartCoroutine(SpawnRoutine(tileset));
        }
    }

    IEnumerator SpawnRoutine(Tileset tileset)
    {
        while (true)
        {
            foreach (PointInfo point in tileset.points)
            {
                GameObject randomPrefab = tileset.tilePrefabs[Random.Range(0, tileset.tilePrefabs.Length)];
                GameObject newTile = (GameObject)Instantiate(randomPrefab, point.point.position, Quaternion.Euler(0f, point.reversed ? tileset.reversedRotation : tileset.rotation, 0f));
                Vector3 moveDirection = point.point.TransformDirection(Vector3.forward);
                Move move = newTile.AddComponent<Move>();
                move.Init(moveDirection, tileset.scrollSpeed, tileset.lifetime);
            }

            yield return new WaitForSeconds(tileset.frequency);
        }
    }
}
