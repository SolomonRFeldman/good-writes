import React from 'react';
import Button from 'react-bootstrap/Button';
import { useDispatch } from 'react-redux';
import { Link } from 'react-router-dom';

export default function LogOutButton(props) {
  const dispatch = useDispatch()
  const removeCurrentUser = () => { dispatch({ type: "REMOVE_CURRENT_USER" }) }

  const handleClick = () => {
    removeCurrentUser()
    localStorage.clear()
  }
  
  return(
    <Link to='/'><Button onClick={handleClick} className={props.className} variant='secondary'>Log Out</Button></Link>
  )

}