import supabase from "../config/supabaseClient";
import { useEffect, useState } from "react";


interface TodoProps {
  error: boolean;
  info: any[];  
}

const Home = () => {
  const [todos, setTodos] = useState<TodoProps>({
    error: false,
    info: [],
  });

  useEffect(() => {
    const getTodos = async () => {
      
      const { data, error } = await supabase.from("todos").select("id, title, description, isCompleted, priority, created_at");

      
      console.log("Supabase data:", data);
      console.log("Supabase error:", error);

      if (error) {
        setTodos((prev) => ({
          ...prev,
          error: true,
          info: [],  
        }));
        console.error("Error fetching todos:", error.message);
      } else {
        
        setTodos((prev) => ({
          ...prev,
          error: false,
          info: data || [],  
        }));
      }
    };

    
    getTodos();
  }, []);

  
  console.log("Todos state:", todos);

  return (
    <div>
    {todos.error ? (
      <p>Error fetching todos: {todos.info}</p>
    ) : (
      <ul>
        {todos.info.map((todo) => (
          <li key={todo.id}>
            <h3>{todo.title}</h3>
            <p>{todo.description}</p>
            <p>{`Completed: ${todo.isCompleted}`}</p>
            <p>{`Priority: ${todo.priority.join(", ")}`}</p>
            <p>{`Created at: ${new Date(todo.created_at).toDateString()}`}</p>
          </li>
        ))}
      </ul>
    )}
  </div>
  );
};

export default Home;
