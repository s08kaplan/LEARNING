import supabase from "../config/supabaseClient"
import { useEffect, useState } from "react";
import axios from "axios";
 
interface TodoProps{
    error: boolean,
    info:  any
}

const Home = () => {
    // console.log(supabase);
    const [todos, setTodos] = useState<TodoProps>({
        error: false,
        info:""
    })

    useEffect(() => {
    const getTodos = async () => {
      const { data } = await supabase.from("todos").select()
      console.log(data);
     !data ?  ( setTodos(prev => ({...prev,
            error: true,
            info: "Error fetching todos"})))
            :
            (
                setTodos(prev => ({ ...prev, error: false, info: data}))
            )
      
    }
getTodos()
    }, [])
    console.log(todos);
  return (
    <div>Home</div>
  )
}

export default Home