# Flutter-Project

## Installation

- Run pub install : `flutter pub get`
- Run flutterfire configuration : `flutterfire configure`

## Firebase configuration

- activate email/password authentication
- activate firestore database with the following default collections :
    - products: collection of products with the following properties :
        - name: string
        - price: double
    - users: collection of users from authentication manager with the following properties :
        - authId: string (id of user in authentication manager)
        - role: "commercial" || "technician"
        - username: string

Firestore Database security rules : 
```
rules_version = '2';

service cloud.firestore {
  match /databases/{database}/documents {
  	match /users/{entry} {
      allow read: if request.auth.uid != null;
    }
  	match /products/{entry} {
      allow read: if request.auth.uid != null;
    }
  	match /sales/{entry} {
      allow read: if request.auth.uid != null;
      allow write: 
      	if request.auth.uid != null
          && "product" in request.resource.data
          && "price" in request.resource.data
          && "user" in request.resource.data
      		&& request.auth.uid == request.resource.data.user
          && "status" in request.resource.data
          && "createdAt" in request.resource.data;
    }
  }
}
```