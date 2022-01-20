# Image-Restoration-MATLAB
The objective of the project is to use the appropriate Inverse and Pseudo-Inverse filters to remove the blur from the image. In the end, it should be able to restore a degraded image by inverse and Weiner filtering and recognize the car license plate and the make of the car. 

# <sub> Original Image (L) and Restored Image (R)
  <img src="https://user-images.githubusercontent.com/97911922/150269935-255a822e-7ef1-4c63-b05d-8ed909f0f754.png" width="49%" height="49%"> <img src="https://user-images.githubusercontent.com/97911922/150270927-2ffe6669-9437-443f-848d-6229e6cfc33b.png" width="49%" height="49%">


# <sub> Restored Results
<img src="https://user-images.githubusercontent.com/97911922/150270277-aeb34cea-31ee-4f36-89a1-96d3e9d8fe4a.png" width="100%" height="100%">
  <img src="https://user-images.githubusercontent.com/97911922/150270082-feb0fb96-a235-4a59-a879-7de5e718be0c.png" width="100%" height="100%">
  <img src="https://user-images.githubusercontent.com/97911922/150270114-c3707c18-e471-46e5-bd87-929acd0b55f5.png" width="100%" height="100%">
   <img src="https://user-images.githubusercontent.com/97911922/150270162-dd0a2ee4-da68-422d-8f25-eacb93f51a06.png" width="100%" height="100%">
    <img src="https://user-images.githubusercontent.com/97911922/150270209-71060211-da66-4427-948f-d6a6ea585402.png" width="100%" height="100%">
    <img src="https://user-images.githubusercontent.com/97911922/150270243-a293ea20-1a9a-48e6-ab80-4c4ffe153142.png" width="100%" height="100%">
<img src="https://user-images.githubusercontent.com/97911922/150270042-8371dd65-10d7-4600-9157-40dc3228e08b.png" width="100%" height="100%">
<img src="https://user-images.githubusercontent.com/97911922/150270337-06ad6ea1-c40d-425c-8e54-9fb60da99e8d.png" width="100%" height="100%">
  
# <sub> Comments
By observing the image, it can be determined that the kind of degradation function that caused the degradation would be the “motion” function, as a designing restoration filter. Furthermore, from the Plot of the 1-D frequency response of the inverse and Weiner filter, the orange straight line is represented by the inverse filter and the wave blue line stands for the Weiner filter. The graphic differences between these two frequency response functions are dramatic.

The performance of Weiner filters applied on the image is way better than the performance of the inverse filters on the images since the Weiner filters can clarify the image. The Wiener filter is a filter used to produce an estimate of a desired or target random process by linear time-invariant filtering of the provided noisy process, this filter also minimizes the mean square error between the estimated random process and the desired process. Additionally, as we can see that, the plate of the vehicle in the provided picture is WX55-HVW, the make of the vehicle is Mitsubishi Motors and the model of the vehicle is mini-SUV.
  
# <sub> MATLAB Objectives
* fspecial: generates a 2-D filter of various kinds, including motion filters that may be used to cause image degradation.
* scale2bytes: scales the intensity of a 2-D image appropriately, and generates an 8-bit digital image.
* logscale2bytes: scales the intensity of a 2-D function appropriately, and generates an 8-bit digital image.
