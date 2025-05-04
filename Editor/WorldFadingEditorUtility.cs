#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;


namespace Menstood
{
    public static class WorldFadingEditorUtility
    {
        [MenuItem("GameObject/World Fading/Create WorldFadingController", false, 10)]
        public static void CreateWorldFadingController()
        {
            // Check if it already exists
            GameObject existing = GameObject.Find("WorldFadingController");
            if (existing != null)
            {
                Selection.activeGameObject = existing;
                Debug.Log("WorldFadingController already exists. Selected existing one.");
                return;
            }

            // Create new GameObject
            GameObject go = new GameObject("WorldFadingController");
            go.AddComponent<WorldFading>();
            Undo.RegisterCreatedObjectUndo(go, "Create WorldFadingController");
            Selection.activeGameObject = go;
        }
    }
}
#endif
