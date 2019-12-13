import React from 'react';
import Navbar from 'react-bootstrap/Navbar';
import LeaveGroupButton from './LeaveGroupButton'
import SelectPiece from './SelectPiece';
import Members from './Members';
import NextPieceButton from './NextPieceButton';

export default function GroupShowSidebar(props) {
  return(
    <Navbar style={{width: '250px'}} className="navbar-dark position-fixed h-100 bg-secondary d-inline-block">
      <Navbar.Brand>Alias: {props.userGroup.alias}</Navbar.Brand>
      <SelectPiece userGroup={props.userGroup} group={props.group} setGroup={props.setGroup} />
      <Members members={props.group.user_groups} />
      {props.userGroup.moderator_status ? <NextPieceButton className='mb-3' group={props.group} setGroup={props.setGroup} /> : null}
      <LeaveGroupButton userGroup={props.userGroup} />
    </Navbar>
  )

}