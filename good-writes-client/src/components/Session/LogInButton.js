import React from 'react'
import ModalButton from '../Modal/ModalButton'
import LogInForm from './LogInForm'

export default function LogInButton(props) {

  return (
    <ModalButton Modal={LogInForm} variant={props.variant} className={props.className}>Log In</ModalButton>
  )

}

LogInButton.defaultProps = { variant: 'primary' }