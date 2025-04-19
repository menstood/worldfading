# Worldfading

A high-performance skybox blending shader for Unity, featuring directional cubemap transitions, procedural dissolve, and HDR glow edge effects. Designed for cinematic environment shifts and seamless world transitions. Supports global control via `_WorldFading` and is optimized for runtime performance with branchless masking.

👉 ภาษาไทยอยู่ข้างล่าง 👇 [จิ้ม](#-ภาษาไทย)

![Skybox Fading Preview](media/preview.gif)

## 🌐 English

🧩 Compatible with **Unity 2022.3 or newer**

## 🔧 Installation

You can import this package directly from the Unity Editor:

1. Open Unity and go to `Window > Package Manager`
2. Click the `+` button (top-left), then select `Add package from git URL...`
3. Paste in the following URL:

```
https://github.com/menstood/worldfading.git
```

4. Click **Add** — Unity will automatically fetch and install the package 🎉

## 🛠 How to Use

### 🔹 1. Create and Configure Material

1. Go to `Assets > Create > Material`
2. Set the Shader to `Skybox/BlendTwoCubemapsWithGlowEdge`
3. Assign cubemaps:
   - `_CubemapA`: Your starting skybox
   - `_CubemapB`: The one you want to transition into

### 🔹 2. Apply Material to Scene

1. Go to `Window > Rendering > Lighting`
2. In the Environment section, assign the material to **Skybox Material**

### 🔹 3. Attach WorldFading.cs

1. Add the script `WorldFading.cs` to any GameObject in your scene

### 🔹 4. Control the Skybox Transition

- For automatic tweening:  
  Call `Play()` in your script

- For manual control:

```csharp
Shader.SetGlobalFloat("_WorldFading", 0.5f); // 0 = A, 1 = B
```

#### 🔹 5. Done! Your skybox will now transition with a cool dissolve and glow effect 🔥

👉 Follow me at [facebook.com/thisisunityth](https://www.facebook.com/thisisunityth)

---

## 🌐 ภาษาไทย

🧩 รองรับ Unity เวอร์ชัน **2022.3 ขึ้นไป**

Shader สำหรับเปลี่ยน skybox แบบเท่ ๆ ใช้ได้กับ Unity โดยตรง  
Blend ระหว่างสอง cubemap ตามมุมกล้อง + ใส่ dissolve ได้แบบ procedural และมีขอบ glow แบบ HDR  
เหมาะกับใช้ตอนเปลี่ยนโลก เปลี่ยนมิติ หรือทำ transition แบบ cinematic  
ควบคุมด้วย `_WorldFading` แค่ตัวเดียว ใช้ง่าย  
ทั้งหมด optimize มาให้รันโคตรลื่น ไม่มี `if` ใน fragment เลย 💨

## 🔧 การติดตั้ง

คุณสามารถติดตั้งแพ็กเกจนี้ผ่าน Unity ได้เลย โดยทำตามขั้นตอนนี้:

1. เปิด Unity แล้วไปที่ `Window > Package Manager`
2. กดปุ่ม `+` ด้านบนซ้าย แล้วเลือก `Add package from git URL...`
3. วาง URL นี้ลงไป:

```
https://github.com/menstood/worldfading.git
```

4. กด Add แล้วรอ Unity ติดตั้งแพ็กเกจให้เรียบร้อย 🎉

## 🛠 วิธีใช้งาน

#### 🔹 1. สร้าง Material และตั้งค่า Shader

1. ไปที่ `Assets > Create > Material`
2. ตั้ง Shader เป็น `Skybox/BlendTwoCubemapsWithGlowEdge`
3. ตั้งค่า Cubemap ให้กับ:
   - `_CubemapA`: Skybox เริ่มต้น
   - `_CubemapB`: Skybox ปลายทางที่อยาก transition ไป

#### 🔹 2. นำ Material ไปใช้ในฉาก

1. เปิดเมนู `Window > Rendering > Lighting`
2. ที่หัวข้อ Environment ให้เลือก Skybox Material เป็นวัสดุที่เพิ่งสร้าง

#### 🔹 3. ใส่สคริปต์ WorldFading.cs

1. เพิ่ม `WorldFading.cs` ไปยัง GameObject ตัวใดก็ได้ในฉาก

#### 🔹 4. สั่งให้เปลี่ยน Skybox

- ถ้าอยากให้ fade แบบ auto:  
  เรียก `Play()` จากสคริปต์

- ถ้าอยากคุมเอง:

```csharp
Shader.SetGlobalFloat("_WorldFading", 0.5f); // 0 = A, 1 = B
```

####🔹 5. จบ! Skybox จะเปลี่ยนพร้อม dissolve และ glow เท่ ๆ 🔥

👉 ติดตามผลงานอื่น ๆ ได้ที่ [นี่หรือUnity บน Facebook](https://www.facebook.com/thisisunityth)

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---
