import React from 'react';
import ModalButton from '../Modal/ModalButton';
import ButtonConfirmation from '../Modal/ButtonConfirmation';
import { withRouter } from 'react-router-dom';
import { deleteRequest } from '../../fetchRequests';

function LeaveGroupButton(props) {
  const action = () => {
    deleteRequest(`/user_groups/${props.userGroup.id}`).then(json => {
      props.history.push('/')
    })
  }
  const modalProps = {action: action, children: 'Are you sure you want to leave this group?'}

  return(
    <ModalButton Modal={ButtonConfirmation} modalProps={modalProps} variant='danger'>
      Leave Group
    </ModalButton>
  )

}

export default withRouter(LeaveGroupButton)
