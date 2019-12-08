import React, { useState, useEffect } from 'react';
import Group from './Group'

export default function Groups(props) {

  const [groups, setGroups] = useState([])

  useEffect(() => { fetch('/groups').then(response => response.json()).then(json => setGroups(json.groups)) }, [])

  return(
    <>{groups.map(group => <Group group={group} />)}</>
  )

}