import React, { useEffect } from 'react'

export default function User(props) {

  useEffect(() => console.log(props))

  return(
    <h1>{props.match.params.id}</h1>
  )

}