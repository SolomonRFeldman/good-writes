import React from 'react';
import Navbar from 'react-bootstrap/Navbar';
import LeaveGroupButton from './LeaveGroupButton'
import SelectPiece from './SelectPiece';

export default function GroupShowSidebar(props) {
  return(
    <Navbar style={{width: '250px'}} className="navbar-dark position-fixed h-100 bg-secondary d-inline-block">
      <Navbar.Brand>Alias: {props.userGroup.alias}</Navbar.Brand>
      <SelectPiece userGroup={props.userGroup} group={props.group} setGroup={props.setGroup} />
      <LeaveGroupButton userGroup={props.userGroup} />
    </Navbar>
  )

}