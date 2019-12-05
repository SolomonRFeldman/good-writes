import React from 'react';
import Navbar from 'react-bootstrap/Navbar';
import LogInBanner from './LogInBanner';

export default function NavBar(props) {

  return (
    <Navbar bg='dark' variant='dark'>
      <Navbar.Brand href='/'>Good Writes</Navbar.Brand>
      <LogInBanner />
    </Navbar>
  );

}