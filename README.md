# Worldfading

👉 English down below 👇 [Jump to English](#-english)

![Skybox Fading Preview](media/preview.gif)

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
3. วาง URL นี้ลงไป: `https://github.com/menstood/worldfading.git`
4. กด Add แล้วรอ Unity ติดตั้งแพ็กเกจให้เรียบร้อย 🎉

👉 ติดตามผลงานอื่น ๆ ได้ที่ [ThisIsUnityTH บน Facebook](https://www.facebook.com/thisisunityth)

---

## 🌐 English

🧩 Compatible with **Unity 2022.3 or newer**

A high-performance skybox blending shader for Unity, featuring directional cubemap transitions, procedural dissolve, and HDR glow edge effects. Designed for cinematic environment shifts and seamless world transitions. Supports global control via `_WorldFading` and is optimized for runtime performance with branchless masking.

## 🔧 Installation

You can import this package directly from the Unity Editor:

1. Open Unity and go to `Window > Package Manager`
2. Click the `+` button (top-left), then select `Add package from git URL...`
3. Paste in the following URL: `https://github.com/menstood/worldfading.git`
4. Click **Add** — Unity will automatically fetch and install the package 🎉

👉 Follow me at [facebook.com/thisisunityth](https://www.facebook.com/thisisunityth)
