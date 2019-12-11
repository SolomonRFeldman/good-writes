import React from 'react';
import Button from 'react-bootstrap/Button';

export default function ShowGroupButton(props) {
  
  return(
    <Button className={props.className} variant='primary'>View</Button>
  )

}