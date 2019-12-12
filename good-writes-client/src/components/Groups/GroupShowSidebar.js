import React from 'react';
import Navbar from 'react-bootstrap/Navbar';
import LeaveGroupButton from './LeaveGroupButton'

export default function GroupShowSidebar(props) {
  return(
    <Navbar style={{width: '250px'}} className="navbar-dark position-fixed h-100 bg-secondary d-inline-block">
      <LeaveGroupButton userGroup={props.userGroup} />
    </Navbar>
  )

}