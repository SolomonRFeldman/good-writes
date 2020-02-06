import React from 'react'
import ModalButton from '../Modal/ModalButton'
import TestUserInfo from './TestUserInfo'

export default function TestUserButton({className}) {
  return(
    <ModalButton className={className} Modal={TestUserInfo} variant='success'>Test User Info</ModalButton>
  )
}