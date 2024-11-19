namespace java com.example.models

// 定义一个简单的用户结构体
struct User {
  1: i32 id,
  2: string name,
  3: string email
}

// 定义一个简单的响应结构体
struct UserResponse {
  1: bool success,
  2: string message,
  3: User user,
  4: optional list<UserRequest> test,
  4: optional list<User> test1,
  5: optional map<string, User> test2,
  6: optional map<string, User> test3,
  7: optional map<string, list<User>> test4,
  8: optional map<string, map<string, User>> test5,
}

struct UserRequest {
  1: bool success,
  2: string message,
  3: User user
}
