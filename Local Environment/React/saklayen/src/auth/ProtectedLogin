import React, { useEffect, useState } from "react";
import { useNavigate, useLocation } from "react-router-dom";
import { CircularProgress } from "@mui/material";
import extStyles from "../../components/ext/styles.module.css";

const ProtectedLogin = (props) => {
    const navigate = useNavigate();
    const location = useLocation();
    const { Component, path } = props;
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const checkLoggedIn = async () => {
            const loggedIn = localStorage.getItem("authToken");
            if (!loggedIn) {
                localStorage.setItem("LoginMsg", "Please login to continue.");
                localStorage.setItem("intendedPath", location.pathname);
                navigate("/login", { replace: true });
            } else {
                navigate(path, { replace: true });

                // const tokenIsValid = await verifyToken(loggedIn);
                // if (tokenIsValid) {
                //     navigate(path, { replace: true });
                // } else {
                //     localStorage.removeItem("authToken");
                //     localStorage.setItem(
                //         "LoginMsg",
                //         "Token expired. Please login again."
                //     );
                //     localStorage.setItem("intendedPath", location.pathname);
                //     navigate("/login", { replace: true });
                // }
            }
            setLoading(false); // Mark data loading as complete after checks are done
        };

        checkLoggedIn();
    }, []);

    const verifyToken = (token) => {
        return new Promise((resolve) => {
            setTimeout(() => {
                resolve(true);
            }, 500);
        });
    };

    return (
        <>
            {loading ? (
                <div className={extStyles.spinnerarea}>
                    <CircularProgress />
                </div>
            ) : (
                <Component />
            )}
        </>
    );
};

export default ProtectedLogin;
