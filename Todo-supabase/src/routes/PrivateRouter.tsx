import React from 'react'
import { Outlet, NavLink } from "react-router-dom"

const PrivateRouter:React.FC = () => {
  const user = true
  return user ? <Outlet/> : <NavLink to="/" />
}

export default PrivateRouter