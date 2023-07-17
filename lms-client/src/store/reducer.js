"use client"
import { GET_USERS_SUCCESS } from "./actions";

const myFirstReducer = (state = {users: []}, action) => {
    switch (action.type){
        case GET_USERS_SUCCESS:
            return {
                ...state,
                users: action.users
            }
        default:
            return state;
    }
}
// export default myFirstReducer;

import { combineReducers } from 'redux';

// Define your reducers here
const rootReducer = combineReducers({
  // Add your reducers
  myFirstReducer
});

export default rootReducer;