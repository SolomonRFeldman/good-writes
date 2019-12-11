import React from 'react';
import Button from 'react-bootstrap/Button';
import { Link } from 'react-router-dom';

export default function ShowGroupButton(props) {
  
  return(
    <Link to={`/groups/${props.group.id}`}><Button className={props.className} variant='primary'>View</Button></Link>
  )

}