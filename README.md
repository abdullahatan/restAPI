# ABAP restAPI Tutorials
## Steps to create a restAPI

### Step 1 : Create a Z table in SAP to store data using T-Code SE11.
![1](https://user-images.githubusercontent.com/26427511/86517473-ddad0480-be31-11ea-9f8a-e5022b5b2c79.png)

![2](https://user-images.githubusercontent.com/26427511/86517573-a3903280-be32-11ea-9603-5149c7d6a6b3.png)

### Step 2 : Create REST Handler and Resource Class

1. Start from create a REST Handler class by inheriting from CL_REST_HTTP_HANDLER. It will force you to redefine IF_REST_APPLICATION~GET_ROOT_HANDLER method.

   ![2](https://user-images.githubusercontent.com/26427511/86517879-2619f180-be35-11ea-9e9f-fe359d9ea22c.png)

   ![3](https://user-images.githubusercontent.com/26427511/86517947-cec85100-be35-11ea-8dd9-f881e9200b70.png)

   [Go to code]

3. Start from create a REST resource class by inheriting from CL_REST_RESOURCE. It will force you to redefine GET and POST methods.

   ![4](https://user-images.githubusercontent.com/26427511/86518075-097eb900-be37-11ea-9713-94e53394f5b3.png)

   ![5](https://user-images.githubusercontent.com/26427511/86518122-67130580-be37-11ea-8eeb-1bbffa57a40d.png)
   
   [Go to code]
   
### Step 3 : Create ICF Node

1. To allow incoming request at specific endpoint, we need to create an ICF node in transaction SICF.

   ![3](https://user-images.githubusercontent.com/26427511/86518714-181b9f00-be3c-11ea-971d-60cd526ad0d6.png)
   
   ![6](https://user-images.githubusercontent.com/26427511/86518740-60d35800-be3c-11ea-9d09-30fc05b0368e.png)
   
   ![4](https://user-images.githubusercontent.com/26427511/86518717-236eca80-be3c-11ea-8d0f-3e316d6ecb73.png)
   
2. Test the endpoint. 

   ![7](https://user-images.githubusercontent.com/26427511/86518800-d8a18280-be3c-11ea-8490-82b19cb02437.png)
   ![dsada](https://user-images.githubusercontent.com/26427511/86518881-b78d6180-be3d-11ea-9f9d-0b4a8c12f289.png)

