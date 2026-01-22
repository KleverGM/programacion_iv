import {  useState, useCallback, useReducer} from "react";
import { View, Text, TextInput, Button } from "react-native";

type State = {
  hours:number
}

type Action =
|{type:"ADD_HOUR"}
|{type:"REMOVE_HOURS"};

const initialState:State={
  hours:0
};

function reducer(state:State, action:Action):State {
  switch(action.type) {
    case "ADD_HOUR":
      return {hours: state.hours + 1};
    case "REMOVE_HOURS":
      return {hours: Math.max(0, state.hours - 1)};
  }
}

export default function ServiceHourReducer() {
  const [state, dispatch] = useReducer(reducer, initialState);

  return (
    <View
      style={{ padding: 16, borderWidth: 1, borderRadius: 8, marginBottom: 14 }}
    >
      <Text>
        Horas de servicio
      </Text>
      <Text>
        Horas actuales {state.hours}
      </Text>
      <View>
        <Button title="+1 hora" onPress={() => dispatch({type:"ADD_HOUR"})} />
        <Button title="-1 hora" onPress={() => dispatch({type:"REMOVE_HOURS"})} />
      </View>
  
    </View>
  );
}
