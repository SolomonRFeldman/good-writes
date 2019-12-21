import React from 'react'
import Button from 'react-bootstrap/Button'
import { patchRequest } from '../../fetchRequests'

export default function NextPieceButton(props) {
  const handleClick = () => {
    const body = { group: { point_in_cycle: props.group.point_in_cycle + 1 } }
    patchRequest(`/groups/${props.group.id}`, body).then(json => {
      props.setGroup(json.group)
    })
  }
  
  return(
    <Button onClick={handleClick} className={props.className} variant={props.variant}>Next Piece</Button>
  )

}

NextPieceButton.defaultProps = { variant: 'success' }