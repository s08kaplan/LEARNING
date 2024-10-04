import React from "react";
import AuthForm from "../components/AuthForm";

const Login:React.FC = () => {
  return (
    <section>
      <AuthForm formType={"login"} />
    </section>
  );
};

export default Login;