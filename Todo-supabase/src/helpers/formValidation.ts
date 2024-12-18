import { object, string } from "yup";
import supabase from "../config/supabaseClient";
import { User, Session } from "@supabase/supabase-js";

// Define the schema for authentication form validation
export const authSchema = object({
  username: string().required("Please enter a username"), // Username cant be empty

  email: string()
    .email("Enter a valid email address please")
    .required("Email is necessary to keep in touch 😉")
    .test(
      "email-validation",
      "Please enter a valid email address",
      function (value) {
        return /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/.test(value);
      }
    ),

  password: string()
    .required("Password is required")
    .min(8, "min. 8 characters needed")
    .max(20, "Password must be max. 20 characters")
    .matches(/\d+/, "at least one number is required")
    .matches(/[a-z]/, "Password must contain at least one lowercase letter")
    .matches(/[A-Z]/, "Password must contain at least one UPPERCASE letter")
    .matches(
      /[!/[@$!%*?&]+/, // Regex for one special character
      "password must contain at least one special (!/[@$!%*?&) character"
    ),
});

// ! Login Register types
type RegisterResponse = {
  user: User | null;
  error: { message: string } | null;
};

type LoginResponse = {
  user: User | null;
  error: { message: string } | null;
};

// !Register function
export const registerUser = async (
  email: string,
  password: string
): Promise<RegisterResponse> => {
  const { data, error } = await supabase.auth.signUp({
    email,
    password,
  });

  return {
    user: data?.user || null,
    error,
  };
};


// ! Login function
export const loginUser = async (
  email: string,
  password: string
): Promise<LoginResponse> => {
  const { data, error } = await supabase.auth.signInWithPassword({
    email,
    password,
  });

  return {
    user: data?.user || null,
    error,
  };
};
