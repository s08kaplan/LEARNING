import { Routes, Route } from "react-router-dom"
import Home from "../pages/Home"
import PostTodo from "../pages/PostTodo"


const AppRouter = () => {
  return (
    <Routes>
        <Route path="/" element={<Home/>} />
        <Route path="post-todo" element={<PostTodo/>} />
    </Routes>
  )
}

export default AppRouter