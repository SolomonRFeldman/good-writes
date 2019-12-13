import React from 'react'
import Button from 'react-bootstrap/Button'

export default function NextPieceButton(props) {
  const handleClick = () => {
    console.log(props.group)
    const configObj = {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify({ group: {point_in_cycle: props.group.point_in_cycle + 1} })
    }
    if(localStorage.token) configObj.headers = { ...configObj.headers, "Token": localStorage.token }

    fetch(`/groups/${props.group.id}`, configObj).then(response => response.json()).then(json => {
      props.setGroup(json.group)
    })
  }
  
  return(
    <Button onClick={handleClick} className={props.className} variant={props.variant}>Next Piece</Button>
  )

}

NextPieceButton.defaultProps = { variant: 'success' }