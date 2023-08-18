import { useEffect } from "react";
import { useNavigate } from "react-router-dom";

const ProtectedLogin = (props) => {
    const navigate = useNavigate();
    const { Component } = props;

    useEffect(() => {
        const loggedIn = localStorage.getItem("authToken");
        if (!loggedIn) {
            localStorage.setItem("LoginMsg", "Please login to continue.");
            navigate("/login", { replace: true });
        } else {
            navigate(props.path, { replace: true });
        }
            
    }, []);
    return (
        <Component />
    );
}

export default ProtectedLogin;
