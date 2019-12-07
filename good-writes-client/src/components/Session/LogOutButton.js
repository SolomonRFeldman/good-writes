import React, { useState } from 'react';
import Button from 'react-bootstrap/Button';
import { connect } from 'react-redux'
import { Redirect } from 'react-router-dom'

function LogOutButton(props) {

  const handleClick = () => {
    props.triggerRedirect('/')
    props.removeCurrentUser()
    localStorage.clear()
  }
  
  return(
    <Button onClick={handleClick} className={props.className} variant='secondary'>Log Out</Button>
  )

}

const mapDispatchToProps = dispatch => ({ 
  removeCurrentUser: payload => { dispatch({ type: "REMOVE_CURRENT_USER", payload }) },
  triggerRedirect: path => { dispatch({ type: 'TRIGGER_REDIRECT', path }) }
})

export default connect(null, mapDispatchToProps)(LogOutButton)