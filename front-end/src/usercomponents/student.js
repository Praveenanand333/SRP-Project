import React, { useState, useEffect } from 'react';
import axios from 'axios';
import Navbarfun from './Navbarfun';
import PDFData from '../PDF/PDFGenerator';
import '../CSS/view.css'
function Student() {
    const [username, setUsername] = useState('');
    const [name, setName] = useState(null);
    axios.defaults.withCredentials = true; 
    useEffect(() => {
        const fetchData = async () => {
            try {
                const response = await axios.get('http://localhost:5000/session', {
                    withCredentials: true 
                });
                const data = response.data;
                console.log(data);
                if (data.username) {
                    setUsername(data.username);
                    axios.get(`http://localhost:5000/getname/${data.username}`)
                    .then(response => {
                        console.log('name:',response.data.name);
                        setName(response.data.name);
                    })
                    .catch(error => {
                        console.log('Error:', error);
                        alert('Error fetching username');
                        
                    });
                    console.log('username set');
                } else {
                   
                    alert('No username found');
                    window.location.href='/';
                }
            } catch (error) {
                console.log('Error:', error);
                alert('Error fetching username');
                window.location.href='/';
            }
        };

        fetchData();
    }, []);

    return (
        <>
       <Navbarfun/>
           
            <h3>Welcome, {name}</h3>
            <PDFData/>


        </>
    );
}

export default Student;
