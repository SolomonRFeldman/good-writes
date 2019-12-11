import React from 'react';
import Card from 'react-bootstrap/Card';
import GroupButtons from './GroupButtons';

export default function Group(props) {

  const buttons = () => { 
    if(props.userGroups) return <GroupButtons className='mt-3 float-right' group={props.group} userGroups={props.userGroups} /> 
  }

  return (
    <Card style={{width: '800px'}} className='mx-auto my-4'>
      <Card.Header>
        <h1 className="display-4 d-inline-block mr-2">{props.group.name}</h1>
        <h3 className="d-inline-block">({props.group.form})</h3>
        {buttons()}
      </Card.Header>
    </Card>
  )
}