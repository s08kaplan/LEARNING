import React from "react";
import AuthForm from "../components/AuthForm";



const Register:React.FC = () => {
  return (
    <section>
      <main> <AuthForm formType={"register"} /></main>
    </section>
  );
};

export default Register;