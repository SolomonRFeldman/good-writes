export default function manageRedirect(state = false, action) {
  switch(action.type) {
    case 'TRIGGER_REDIRECT':
      return true;
    case 'RESET_REDIRECT_TRIGGER':
      return false;
    default:
      return state;
  };
};