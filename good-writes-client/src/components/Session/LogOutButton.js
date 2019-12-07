import React from 'react';
import Button from 'react-bootstrap/Button';
import { connect } from 'react-redux'

function LogOutButton(props) {

  const handleClick = () => {
    props.removeCurrentUser()
    localStorage.clear()
  }
  
  return(
    <Button onClick={handleClick} className={props.className} variant='secondary'>Log Out</Button>
  )

}

const mapDispatchToProps = dispatch => ({ removeCurrentUser: payload => { dispatch({ type: "REMOVE_CURRENT_USER", payload }) } })

export default connect(null, mapDispatchToProps)(LogOutButton)