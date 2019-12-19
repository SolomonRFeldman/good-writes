import React, { useState, useEffect } from 'react';
import Group from './Group';

export default function Groups(props) {

  const [groups, setGroups] = useState([])
  const [userGroups, setUserGroups] = useState([])

  useEffect(() => { 
    const configObj = {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      }
    }
    if(localStorage.token) configObj.headers = { ...configObj.headers, "Token": localStorage.token }

    fetch('/groups', configObj).then(response => response.json()).then(json => {
      setUserGroups(json.user_groups)
      setGroups(json.groups)
    })
  }, [props.currentUser])

  return(
    <>{groups.map(group => <Group key={group.id} group={group} userGroups={userGroups} />)}</>
  )

}