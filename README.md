# ABAP restAPI Tutorials
## Steps to create a restAPI

### Step 1 : Create a Z table in SAP to store data using T-Code SE11.
![1](https://user-images.githubusercontent.com/26427511/86517473-ddad0480-be31-11ea-9f8a-e5022b5b2c79.png)

![2](https://user-images.githubusercontent.com/26427511/86517573-a3903280-be32-11ea-9603-5149c7d6a6b3.png)

### Step 2 : Create REST Handler and Resource Class

-Start from create a REST Handler class by inheriting from CL_REST_HTTP_HANDLER. It will force you to redefine IF_REST_APPLICATION~GET_ROOT_HANDLER method.

