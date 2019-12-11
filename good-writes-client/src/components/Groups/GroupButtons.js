import React from 'react';
import ButtonToolbar from 'react-bootstrap/ButtonToolbar';
import JoinGroupButton from './JoinGroupButton';
import ShowGroupButton from './ShowGroupButton';

export default function LogInButtons(props) {
  const isInGroup = () => props.userGroups.some(userGroup => userGroup.group_id === props.group.id)

  return (
    <ButtonToolbar className={props.className}>
      {isInGroup() ? <ShowGroupButton /> : <JoinGroupButton />}
    </ButtonToolbar>
  )

}