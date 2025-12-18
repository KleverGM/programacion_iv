import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";
import { Parte05Lab } from "./src/screens/Parte05Lab";

export default function App() {
  return (
    <>
      <Parte05Lab />
    </>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#0d1117",
    alignItems: "center",
    justifyContent: "center",
    padding: 16,
  },
  texto: {
    flex: 1,
    color: "#ffffff",
    backgroundColor: "#0d1117",
    alignItems: "center",
    justifyContent: "center",
    fontSize: 18,
  },
});