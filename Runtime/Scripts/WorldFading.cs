using UnityEngine;
using System.Collections;

public class WorldFading : MonoBehaviour
{
    [Header("Fade Settings")]
    public float startValue = -5f;
    public float endValue = 5f;
    public float duration = 3f;

    [Header("Behavior")]
    public bool playOnStart = true;
    public bool loop = false;
    public AnimationCurve easing = AnimationCurve.Linear(0, 0, 1, 1);

    [Header("Directional Light Settings")]
    public Light directionalLight;
    public Color lightColorA = Color.white;
    public Color lightColorB = new Color(1f, 0.3f, 0.3f);
    public float intensityA = 1f;
    public float intensityB = 0.4f;

    private Coroutine fadeCoroutine;

    void Start()
    {
        if (playOnStart)
        {
            Play();
        }
    }

    public void Play()
    {
        if (fadeCoroutine != null)
            StopCoroutine(fadeCoroutine);

        fadeCoroutine = StartCoroutine(FadeRoutine());
    }

    public void Stop()
    {
        if (fadeCoroutine != null)
        {
            StopCoroutine(fadeCoroutine);
            fadeCoroutine = null;
        }
    }

    private IEnumerator FadeRoutine()
    {
        float time = 0f;

        while (time < duration)
        {
            time += Time.deltaTime;
            float t = Mathf.Clamp01(time / duration);
            float eased = easing.Evaluate(t);
            float value = Mathf.Lerp(startValue, endValue, eased);

            Shader.SetGlobalFloat("_WorldFading", value);

            if (directionalLight != null)
            {
                float lerpT = Mathf.InverseLerp(startValue, endValue, value);
                directionalLight.color = Color.Lerp(lightColorA, lightColorB, lerpT);
                directionalLight.intensity = Mathf.Lerp(intensityA, intensityB, lerpT);
            }

            yield return null;
        }

        // Ensure final state is correct
        Shader.SetGlobalFloat("_WorldFading", endValue);

        if (directionalLight != null)
        {
            float finalT = endValue >= startValue ? 1f : 0f;
            directionalLight.color = Color.Lerp(lightColorA, lightColorB, finalT);
            directionalLight.intensity = Mathf.Lerp(intensityA, intensityB, finalT);
        }

        if (loop)
        {
            float temp = startValue;
            startValue = endValue;
            endValue = temp;
            Play();
        }
    }
}
