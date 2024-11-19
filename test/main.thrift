namespace java com.example.service

// 引入 user.thrift
include "user.thrift"

// 定义用户服务
service UserService {
  // 根据用户 ID 获取用户信息
  UserResponse getUserById(1: i32 userId),
  
  // 添加新用户
  UserResponse addUser(1: User newUser)
}
