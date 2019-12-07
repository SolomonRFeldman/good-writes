import React from 'react';
import Nav from 'react-bootstrap/Nav';
import ButtonToolbar from 'react-bootstrap/ButtonToolbar';
import LogOutButton from '../Session/LogOutButton';
import { Link } from 'react-router-dom';

export default function UserBanner(props) {
  
  let navlink;
  if(props.currentUser.username) {
    navlink = <Nav.Link as={Link} to={`/users/${props.currentUser.id}`}>
      Welcome, {props.currentUser.username}
      </Nav.Link>
  }

  return(
    <ButtonToolbar className={props.className}>
      <ul className='navbar-nav mr-sm-2'>
        <Nav.Item className='active' >
          {navlink}
        </Nav.Item>
      </ul>
      <LogOutButton className='my-2 my-sm-0' />
    </ButtonToolbar>
  )
}