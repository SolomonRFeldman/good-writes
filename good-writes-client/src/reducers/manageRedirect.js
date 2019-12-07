export default function manageRedirect(state = '', action) {
  switch(action.type) {
    case 'TRIGGER_REDIRECT':
      return action.path;
    case 'RESET_REDIRECT_TRIGGER':
      return '';
    default:
      return state;
  };
};