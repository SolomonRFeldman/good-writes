import React from 'react';
import ModalButton from '../Modal/ModalButton';
import ButtonConfirmation from '../Modal/ButtonConfirmation';

export default function LeaveGroupButton(props) {
  const action = () => {}
  const modalProps = {action: action, children: 'Are you sure you want to leave this group?'}

  return(
    <ModalButton Modal={ButtonConfirmation} modalProps={modalProps} variant='danger'>
      Leave Group
    </ModalButton>
  )

}