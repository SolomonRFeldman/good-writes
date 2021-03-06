import React from 'react';
import './Group.css';
import Card from 'react-bootstrap/Card';
import GroupButtons from './GroupButtons';

export default function Group(props) {

  const buttons = () => { 
    if(props.userGroups) return <GroupButtons className='my-auto mx-auto buttons' group={props.group} userGroups={props.userGroups} /> 
  }

  return (
    <Card className='group mx-auto my-4' style={{maxWidth: '800px', width: '80%'}}>
      <Card.Header className='header'>
        <div className='label'>
          <h1 className="display-4 d-inline-block mr-2">{props.group.name}</h1>
          <h3 className="d-inline-block">( {props.group.form} )</h3>
        </div>
          {buttons()}
      </Card.Header>
    </Card>
  )
}