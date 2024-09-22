import { useState } from "react";
import supabase from "../config/supabaseClient";

interface PostTypes {
  title: string;
  isCompleted: boolean;
  description: string;
  priority: string[];
  error: false | string | {};
}

const PostTodo = () => {
  const [posts, setPosts] = useState<PostTypes>({
    title: "",
    isCompleted: false,
    description: "",
    priority:["Low"],
    error: false,
  });

  const handleChange = (e:React.ChangeEvent<HTMLInputElement> | React.ChangeEvent<HTMLSelectElement>) => {
    const { name, value } = e.target
    setPosts(prev => ({
      ...prev,
      [name]: value
    }))
    console.log(name, value);
  }

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault()
   
    const { data: existingPosts, error: fetchError } = await supabase
        .from('todos')
        .select('id')
        .or(`title.eq.${posts.title},description.eq.${posts.description}`)
        .single();

    if (fetchError) {
        console.error("Error fetching existing posts:", fetchError);
        return;
    }

    if (existingPosts) {
        setPosts(prev => ({
            ...prev,
            error: "A post with this title or description already exists.",
        }));
    } else {
        // Proceed with the insert if there are no conflicts
        const { data, error } = await supabase
            .from("todos")
            .insert([{ title: posts.title, description: posts.description, priority: posts.priority, isCompleted: posts.isCompleted }]);
        
        if (error) {
            console.error("Error inserting post:", error);
        }
        console.log(data);
    }
   setPosts(prev => ({...prev,  title: "",
    isCompleted: false,
    description: "",
    priority:["Low"],
    error: false,}))

  }
  return (
    <section>
      <form onSubmit={handleSubmit}>
        <label htmlFor="title">Title</label>
        <input
         type="text"
         id="title"
         name="title"
         value={posts.title}
         onChange={handleChange}
         required
         />


        <label htmlFor="description">Description</label>
        <input
         type="text"
         id="description"
         name="description"
         value={posts.description}
         onChange={handleChange}
         required
         />
        <label htmlFor="priority">Priority</label>
        <select name="priority" id="priority" onChange={handleChange}>
        <option value="low">Low</option>
        <option value="medium">Medium</option>
        <option value="high">High</option>
      </select>

        <label htmlFor="isCompleted">Completed :</label>
      <select name="isCompleted" id="isCompleted" onChange={handleChange}>
        <option value="true">True</option>
        <option value="false">False</option>
      </select>
      <button type="submit">Submit</button>
      </form>
    </section>
  );
};

export default PostTodo;
