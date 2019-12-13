import React from 'react'
import Navbar from 'react-bootstrap/Navbar'
import Nav from 'react-bootstrap/Nav'
import { Link } from 'react-router-dom'

export default function UserShowSidebar(props) {
  const groupMap = () => {
    return props.groups.map(group => {
      return(
        <Nav.Link className='text-light' to={`/groups/${group.id}`} as={Link} key={group.id}>{group.name}</Nav.Link>
      )
    })
  }

  return(
    <Navbar style={{width: '250px'}} className="navbar-dark position-fixed h-100 bg-secondary d-inline-block">
      <Navbar.Brand>Your Groups: </Navbar.Brand>
      <Nav className='flex-column'>{groupMap()}</Nav>
    </Navbar>
  )

}