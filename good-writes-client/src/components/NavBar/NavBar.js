import React, { Component } from 'react';
import Navbar from 'react-bootstrap/Navbar';

export default class NavBar extends Component {

  render() {
    return (
      <Navbar bg='dark' variant='dark'>
        <Navbar.Brand href='/'>Good Writes</Navbar.Brand>
      </Navbar>
    );
  };

}