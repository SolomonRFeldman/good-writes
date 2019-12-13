import React from 'react';
import NavbarBrand from 'react-bootstrap/NavbarBrand';

export default function Members(props) {

  return(
    <React.Fragment>
      <NavbarBrand className='text-white mb-1'>Members: </NavbarBrand>
      {props.members.map(member => <div key={member.id} className='ml-4 mb-3 text-white '>{member.alias}</div>)}
    </React.Fragment>
  )

}