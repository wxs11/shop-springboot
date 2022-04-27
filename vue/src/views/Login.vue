<template>
    <div
      class="container"
      style="
        width: 100%;
        height: 100vh;
        background-color: darkslateblue;
        overflow: hidden;
      "
    >
      <div class="login-box">
        <div class="login-text">
          登 录
          <br />
          <span>欢迎登录汇鑫管理系统</span>
        </div>
        <el-form :model="user" :rules="rules" ref="userForm">
          <el-form-item prop="username">
            <el-input
              size="medium"
              style="margin: 10px 0"
              prefix-icon="el-icon-user"
              v-model="user.username"
              placeholder="请输入用户名"
            ></el-input>
          </el-form-item>
          <el-form-item prop="password">
            <el-input
              size="medium"
              style="margin: 10px 0"
              prefix-icon="el-icon-lock"
              show-password
              placeholder="请输入密码"
              v-model="user.password"
            ></el-input>
          </el-form-item>
          <el-form-item style="margin: 10px 0; text-align: right">
            <el-button
              type="warning"
              size="small"
              autocomplete="off"
              @click="$router.push('/register')"
              >注册</el-button
            >
            <el-button
              type="primary"
              size="small"
              autocomplete="off"
              @click="login"
              >登录</el-button
            >
          </el-form-item>
        </el-form>
      </div>
    </div>
</template>

<script>
import { setRoutes } from "@/router";

export default {
  name: "Login",
  data() {
    return {
      user: {},
      rules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" },
          { min: 3, max: 10, message: "长度在 3 到 5 个字符", trigger: "blur" },
        ],
        password: [
          { required: true, message: "请输入密码", trigger: "blur" },
          {
            min: 1,
            max: 20,
            message: "长度在 1 到 20 个字符",
            trigger: "blur",
          },
        ],
      },
    };
  },
  methods: {
    login() {
      this.$refs["userForm"].validate((valid) => {
        if (valid) {
          // 表单校验合法
          this.request.post("/user/login", this.user).then((res) => {
            if (res.code === "200") {
              localStorage.setItem("user", JSON.stringify(res.data)); // 存储用户信息到浏览器
              localStorage.setItem("menus", JSON.stringify(res.data.menus)); // 存储用户信息到浏览器
              // 动态设置当前用户的路由
              setRoutes();
              this.$message.success("登录成功");

              if (res.data.role === "ROLE_USER") {
                this.$router.push("/home");
              } else {
                this.$router.push("/");
              }
            } else {
              this.$message.error(res.msg);
            }
          });
        }
      });
    },
  },
};
</script>

<style>
.container {
  width: 100%;
  height: 100%;
  background: url('../assets/images/login.png');
  background-size: 100% 100%;
}

.logo-box {
  position: absolute;
  top: 30px;
  left: 30px;
}

.login-box {
  position: absolute;
  top: 50%;
  left: 25%;
  width: 400px;
  height: 400px;
  transform: translate(-50%, -50%);
  border: 1px solid #ccc;
  border-radius: 5px;
}

.login-text {
  width: 100%;
  font-size: 24px;
  text-align: center;
  color: #2f82fe;
  margin-bottom: 50px;
  box-sizing: border-box;
  padding: 20px;
}

.el-form-item {
  width: 90%;
  margin: 20px auto;
}

.login-text span {
  line-height: 30px;
  font-size: 18px;
  color: #666666;
}

.btns {
  width: 100%;
  text-align: center;
  margin-top: 50px;
}

</style>
