import React, { useState, useEffect } from 'react';
import Group from './Group';
import { getRequest } from '../../fetchRequests';

export default function Groups(props) {

  const [groups, setGroups] = useState([])
  const [userGroups, setUserGroups] = useState([])

  useEffect(() => {
    getRequest('/groups').then(json => {
      setUserGroups(json.user_groups)
      setGroups(json.groups)
    })
  }, [props.currentUser])

  return(
    <>{groups.map(group => <Group key={group.id} group={group} userGroups={userGroups} />)}</>
  )

}