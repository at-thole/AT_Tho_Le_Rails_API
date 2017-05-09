##JSON Objects returned by API:

### Users (for authentication)

  {
    "user": {
      "id": "1",
      "username": "le van tho",
      "email": "lvtho129@gmail.com",
      "avatar": "abc123.png",
      "phone": "0123456789",
      "address": "123 abc",
      "role": 1
    }
  }

###Profile

  {
    "user": {
      "id": "1",
      "username": "le van tho",
      "email": "lvtho129@gmail.com",
      "avatar": "abc123.png",
      "phone": "0123456789",
      "address": "123 abc",
      "followers": "100",
      "following": "90"
    }
}

###List Users
  {
    "users": [
      {
        "id": "1",
        "username": "le van tho",
        "email": "lvtho129@gmail.com",
        "avatar": "abc123.png",
        "phone": "0123456789",
        "address": "123 abc"
      },
    {
        "id": "1",
        "username": "le van tho 1",
        "email": "lvtho1291@gmail.com",
        "avatar": "abc1231.png",
        "phone": "0987654321",
        "address": "123 abc 123"
      }
    ]
  }

### Category
  {
    "category":
        {
          "id": 1,
          "name": "Novel"
        }
  }

###Categories

  {
    "categories":
      [
        {
          "id": 1,
          "name": "Novel"
        },
        {
          "id": 2,
          "name": "Love"
        }
      ]
  }

### Article
  {
    "article":
    {
      "id": 1,
      "title": "novel 1",
      "content": "this is first novel",
      "created_at": "09/05/2017 01:02:00",
      "updated_at": "09/05/2017 01:02:00",
      "picture": "abc123.png",
      "category":{
        "id": 1,
        "name": "novel"
      },
      "user":{
        "id": 1,
        "email": "lvtho129@gmail.com",
        "avatar": "abc123.png",
       }
       favorited: 0,
       totals_favorites: 12
    }
  }

###Articles
  {
    "articles":{
      [
        {
          "id": 1,
          "title": "novel 1",
          "content": "this is first novel",
          "created_at": "09/05/2017 01:02:00",
          "updated_at": "09/05/2017 01:02:00",
          "picture": "abc123.png",
          "category":{
            "id": 1,
            "name": "novel"
          },
          "user":{
            "id": 1,
            "email": "lvtho129@gmail.com",
            "avatar": "abc123.png",
           }
           favorited: 0,
           totals_favorites: 12
          },
          {
            "id": 1,
            "title": "novel 2",
            "content": "this is second novel",
            "created_at": "09/05/2017 02:03:00",
            "updated_at": "09/05/2017 02:03:00",
            "picture": "abc1231.png",
            "category":{
              "id": 1,
              "name": "novel"
            },
          "user":{
            "id": 1,
            "email": "lvtho129@gmail.com",
            "avatar": "abc123.png",
           }
           favorited: 1,
           totals_favorites: 7
       }
      ]
    }
  }

### Comment
  {
    "comment":
      {
        "id": 1,
        "article_id": 1,
        "user":{
          "id": 1,
          "username": "le van tho"
          "avatar": "abc123.png"
        },
        "created_at": "09/05/2017 01:02:00",
        "updated_at": "09/05/2017 01:02:00",
        "content": "this is my blog"
      }
  }
###Comments
  {
    "comment":
      [
        {
          "id": 1,
          "article_id": 1,
          "user":{
            "id": 1,
            "email": "lvtho129@gmail.com",
            "avatar": "abc123.png"
          },
          "created_at": "09/05/2017 10:00:00",
          "updated_at": "09/05/2017 10:00:00",
          "content": "this is blog 1"
        },
        {
          "id": 2,
          "article_id": 1,
          "user":{
            "id": 2,
            "email": "lvtho1291@gmail.com",
            "avatar": "abc1231.png"
          },
          "created_at": "09/05/2017 01:02:00",
          "updated_at": "09/05/2017 01:02:00",
          "content": "this is blog 2"
        }
      ]
  }

###Contact
{
    "contact": {
      "id": "1",
      "username": "le van tho",
      "email": "lvtho129@gmail.com",
      "content": "warning blog"
    }
}

##Endpoints:

### Register
POST /api/users/signup

{
  "user": {
      "email": "lvtho129@gmail.com",
      "password": "123456",
      "password_confirmation": "123456",
      "username": "le van tho",
      "phone": "0123456789",
      "address": "abc 123".
      "avatar": "abc123.png"
    }
}


###Login

POST /api/users/login

  {
    "user":{
      "email": "lvtho129@gmail.com",
      "password": "123456",
    }

###update user

PUT api/user
Authentication required, returns User

###update category

PUT /api/categories/:id
Authentication required,check role, returns Category

###update comment

PUT /api/comment
Authentication required, returns a Comment

###update article

PUT /api/article
Authentication required, returns a Article

###delete user
DELETE /api/users/:id
Authentication required, check role

###delete category
DELETE /api/categories/:id
Authentication required, check role

###delete comment
DELETE /api/comments/:id
Authentication required

###delete article
DELETE /api/articles/:id
Authentication required

###follow
POST /api/profiles/:username/follow
Authentication required, returns a Profile

###unfollow
DELETE /api/profiles/:username/follow
Authentication required, returns a Profile

###favorite
POST /api/articles/:id/favorite
Authentication required, returns a Article

###unfavorite
DELETE /api/profiles/:id/favorite
Authentication required, returns a Article
