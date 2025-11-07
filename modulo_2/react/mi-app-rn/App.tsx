import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';
import SaludoProps from './src/components/SaludoProps';
import Contador from './src/components/Contador';
import Caja from './src/components/Caja';
import Saludo from './src/components/saludo';

export default function App() {
  return (
    <View style={{ flex: 1, justifyContent: "center", alignItems: "center", backgroundColor: "#0d1117" }}>
      <Saludo />      
      <Text style={{color: "yellow"}}>bienvenido</Text>
      <StatusBar style="auto" />
      <SaludoProps nombre='Klever'/>
      <Contador/>
      <Caja/>
    </View>
    
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
