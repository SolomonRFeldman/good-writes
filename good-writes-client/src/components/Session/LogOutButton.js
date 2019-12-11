import React from 'react';
import Button from 'react-bootstrap/Button';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

function LogOutButton(props) {

  const handleClick = () => {
    props.removeCurrentUser()
    localStorage.clear()
  }
  
  return(
    <Link to='/'><Button onClick={handleClick} className={props.className} variant='secondary'>Log Out</Button></Link>
  )

}

const mapDispatchToProps = dispatch => ({ 
  removeCurrentUser: payload => { dispatch({ type: "REMOVE_CURRENT_USER", payload }) }
})

export default connect(null, mapDispatchToProps)(LogOutButton)