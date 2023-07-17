'use client';
import { Button, Checkbox, Col, Form, Input, Row, notification } from 'antd';
import { BookOutlined} from '@ant-design/icons';
import Login from '@/components/Login';
import Register from '@/components/Register';
import { useEffect, useState } from 'react';
import moment from 'moment';

 

export default function Main() {
  const [loginFormActive, setLoginFormActive] = useState(true);
  const [isActiveUser, setIsActiveUser] = useState(false);

  const handleLogin = async (values) => {
    try {
      const res = await fetch('http://localhost:8081/login', {
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        method: "POST",
        body: JSON.stringify({name:values.username,
        password: values.password})
      })
    
      // Recommendation: handle errors
      if (!res.ok) {
        // This will activate the closest `error.js` Error Boundary
        throw new Error('Failed to fetch data')
      }
      const userData = await res.json()
      console.log("response: ", userData);
      setIsActiveUser(true);
      localStorage.setItem("userData",JSON.stringify(userData))
      // return await res.json()
    } catch (error) {
      console.error(error);
    }
  };
  const onFinishFailed = (errorInfo) => {
    console.log('Failed:', errorInfo);
  };
  const handleRegistration = async (values) => {
    console.log('Received values of form: ', values, process.env.API_URL);
    
    try {
      const payload = {
        "address": values.address,
        "email": values.email,
        "first_name": values.first_name,
        "last_name": values.last_name,
        "password": values.password,
        "phone": values.phone,
        "name": values.preferred_name,
        "zipcode": values.zipcode,
        "city": values.city,
        "state": values.state,
        "created_at": moment().format("YYYY-MM-DD HH:mm:ss")
    }
      const res = await fetch(`http://localhost:8081/users`, {
        mode: 'cors',
        headers: {
          'Accept': '*/*',
          'Content-Type': 'application/json'
        },
        method: "POST",
        body: JSON.stringify(payload)
      })
    
      // Recommendation: handle errors
      if (!res.ok) {
        // This will activate the closest `error.js` Error Boundary
        throw new Error('Failed to fetch data')
      }
      const userData = await res.json()
      if(userData.code == "200"){
        notification.open({
          description:`${userData.message}`,
          onClick: () => {
            console.log('Notification Clicked!');
          },
        });
        setLoginFormActive(true)
      }
    } catch (error) {
      console.log(error)
    }
  };
  
  useEffect(()=> {
    if(isActiveUser) {
      location.replace('/dashboard');
    }
  }, [isActiveUser])



  return (
    <>
      <Row className='bg-[#ffffff] shadow-lg py-[15px]'>
        <Col span={8} className='pl-[10px] text-xl'>
          <BookOutlined className='inline-block' />
          <h1 className='inline-block pl-[5px]'>Bookhouse</h1>
        </Col>
        <Col span={8}></Col>
        <Col span={8}></Col>
      </Row>
      <div class="max-w-[45%] m-auto mt-6 bg-[#ffffff]">

        <div
          class="border-t-4 border-blue-600 overflow-hidden rounded shadow-lg"
        >
          <h3 class="text-xl text-center mt-8 mb-8">Welcome to Bookhouse!</h3>
          <div class="text-xs text-center mb-8">Library Management System</div>
          {loginFormActive ? <><Login loginSubmit={handleLogin} /><div class="bg-gray-100 text-center text-gray-700 py-5">
            Don't have a account?
            <a href="#" onClick={() => setLoginFormActive(false)} class="font-semibold no-underline text-black">Signup</a>
          </div></> : <><Register onSubmit={handleRegistration} /><div class="bg-gray-100 text-center text-gray-700 py-5">
            Already a member?
            <a href="#" onClick={() => setLoginFormActive(true)} class="font-semibold no-underline text-black">Login</a>
          </div></>}
          
        </div>
      </div>
    </>
  )
}