# ABAP restAPI Tutorials
## Steps to create a restAPI

### Step 1 : Create a Z table in SAP to store data using T-Code SE11.
![1](https://user-images.githubusercontent.com/26427511/86517473-ddad0480-be31-11ea-9f8a-e5022b5b2c79.png)

![2](https://user-images.githubusercontent.com/26427511/86517573-a3903280-be32-11ea-9603-5149c7d6a6b3.png)

### Step 2 : Create REST Handler and Resource Class

1. Start from create a REST Handler class by inheriting from CL_REST_HTTP_HANDLER. It will force you to redefine IF_REST_APPLICATION~GET_ROOT_HANDLER method.

![2](https://user-images.githubusercontent.com/26427511/86517879-2619f180-be35-11ea-9e9f-fe359d9ea22c.png)

![3](https://user-images.githubusercontent.com/26427511/86517947-cec85100-be35-11ea-8dd9-f881e9200b70.png)

2. [Go to code]

3. Start from create a REST resource class by inheriting from CL_REST_RESOURCE. It will force you to redefine IF_REST_RESOURCE~GET and IF_REST_RESOURCE~POST methods.

![4](https://user-images.githubusercontent.com/26427511/86518075-097eb900-be37-11ea-9713-94e53394f5b3.png)

![5](https://user-images.githubusercontent.com/26427511/86518122-67130580-be37-11ea-8eeb-1bbffa57a40d.png)

