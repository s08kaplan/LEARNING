import { Routes, Route } from "react-router-dom";
import PrivateRouter from "./PrivateRouter";
import Login from "../pages/Login";
import Register from "../pages/Register";
import Home from "../pages/Home";
import PostTodo from "../pages/PostTodo";

const AppRouter = () => {
  return (
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="login" element={<Login />} />
      <Route path="register" element={<Register />} />
      <Route path="post-todo" element={<PrivateRouter />}>
        <Route path="" element={<PostTodo />} />
      </Route>
    </Routes>
  );
};

export default AppRouter;
