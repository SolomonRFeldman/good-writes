import React from 'react';
import Nav from 'react-bootstrap/Nav'

export default function UserBanner(props) {
  
  let navlink;
  if(props.currentUser.username) navlink = <Nav.Link>Welcome, {props.currentUser.username}</Nav.Link>

  return(
    <ul className={'navbar-nav mr-sm-2 ' + props.className}>
      <Nav.Item className='active' >
        {navlink}
      </Nav.Item>
    </ul>
  )
}