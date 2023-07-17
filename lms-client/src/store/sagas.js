"use client"
import {all, call, put, takeEvery} from 'redux-saga/effects'
import { GET_USERS_FETCH, GET_USERS_SUCCESS, FETCH_EXAMPLE_DATA, setExampleData } from './actions'

function usersFetch() {
    return fetch('https://jsonplaceholder.typicode.com/users').then(response => response.json());
}

function* workGetUsersFetch() {
    const users = yield call(usersFetch);
    yield put({type: GET_USERS_SUCCESS, users})
}

// Example saga
export function* fetchExampleDataSaga() {
    try {
      // Make an API call or perform any async task
      const response = yield call(usersFetch);
  
      // Dispatch a success action with the received data
      yield put(setExampleData(response.data));
    } catch (error) {
      // Dispatch an error action if something goes wrong
      yield put({ type: 'API_CALL_FAILED', error });
    }
  }
  
  // Watcher saga
  export function* watchExampleSaga() {
    yield takeEvery(FETCH_EXAMPLE_DATA, fetchExampleDataSaga);
  }

function* rootSaga() {
    yield all([watchExampleSaga()])
}

export default rootSaga