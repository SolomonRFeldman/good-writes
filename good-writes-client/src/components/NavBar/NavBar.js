import React from 'react';
import Navbar from 'react-bootstrap/Navbar';
import LogInBanner from './LogInBanner';
import { Link } from 'react-router-dom';

export default function NavBar(props) {

  return (
    <Navbar className={props.className} bg='dark' variant='dark'>
      <Navbar.Brand as={Link} to='/'>Good Writes</Navbar.Brand>
      <LogInBanner className='ml-auto' />
    </Navbar>
  );

}