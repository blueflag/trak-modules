# trak-modules

This is a centralised TRAK terraform repository for managing common modules to promote reuse across TRAK projects.

The structure of the folder is as follows:
VENDOR/SERVICE/COMPONENT

e.g. 
1. For adding CORS config in API gateway 
`aws/api-gateway/cors`

*Note:* In the future, we will add different vendors.

## How to publish a new tag?
Whenever there is a new release of modules. We can publish a new tag using semantic versioning.

To create a tag, replace the version in the command and run it:

`git tag v0.1.0 main`

Push the tag to origin:
`git push origin tag v0.1.0`